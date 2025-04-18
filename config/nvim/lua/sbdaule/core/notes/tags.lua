-- TODO: Add search support

local M = {}

local function flatten_tags(tree, prefix, result)
  for _, item in ipairs(tree) do
    if type(item) == 'string' then
      table.insert(result, prefix .. item)
    elseif type(item) == 'table' then
      for k, v in pairs(item) do
        table.insert(result, prefix .. k)
        flatten_tags(v, prefix .. k .. '/', result)
      end
    end
  end
end

local function get_all_tags()
  local lyaml = require 'lyaml'
  local tags_file = require('plenary.path'):new {
    R('sbdaule.core.config').notes_dir,
    '.note-tools',
    'tags.yaml',
  }

  if not tags_file:exists() then
    vim.notify 'No tags file'
    return {}
  end

  tags_file = tags_file:absolute()
  local file_content = table.concat(vim.fn.readfile(tags_file), '\n')
  local loaded_tags = lyaml.load(file_content, {})

  -- vim.notify(vim.inspect(loaded_table))
  local flat_tags = {}
  flatten_tags(loaded_tags, '', flat_tags)
  return flat_tags
end

---Get frontmatter of the markdown document
---@param opts table | nil
---@return string
local function get_md_frontmatter(opts)
  local ts_parser = vim.treesitter.get_parser(0, 'markdown', opts)
  if ts_parser == nil then
    return ''
  end

  local root = ts_parser:parse()[1]:root()
  -- vim.notify(vim.inspect(root))

  local metadata_query = vim.treesitter.query.parse(
    'markdown',
    [[
      (minus_metadata) @metadata
    ]]
  )

  local metadata = ''
  for _, node in metadata_query:iter_captures(root, 0, 0, -1) do
    if #metadata_query.captures ~= 1 then
      vim.notify(
        'Expected single frontmatter block, '
          .. #metadata_query.captures
          .. ' were found.',
        vim.log.levels.WARN
      )
    end
    metadata = vim.treesitter.get_node_text(node, 0)
  end
  local lines = vim.split(metadata, '\n', { plain = true, trimempty = true })

  -- Remove first and last lines
  table.remove(lines, 1)
  table.remove(lines, #lines)
  return table.concat(lines, '\n')
end

---Get tags for current buffer
---@param opts? table|nil
---@return List
local function get_current_buf_tags(opts)
  local List = require 'plenary.collections.py_list'
  local lyaml = require 'lyaml'
  local file_content = get_md_frontmatter(opts)
  local metadata_table = lyaml.load(file_content, {}) or {}

  if metadata_table['tags'] then
    return List(metadata_table['tags'])
  else
    vim.notify 'No tags in metadata'
    return List {}
  end
end

---Set tags for current buffer
---@param tags table
---@param opts? table|nil
local function set_current_buf_tags(tags, opts)
  local lyaml = require 'lyaml'
  local file_content = get_md_frontmatter(opts) -- You must already have this implemented
  local metadata_table = lyaml.load(file_content, {}) or {}

  -- Update tags

  local processed_tags = {}

  for _, tag in ipairs(tags) do
    local tag_hirarchy = vim.split(tag, '/')
    local tag_leaf = tag_hirarchy[#tag_hirarchy]
    table.insert(processed_tags, tag_leaf)
  end

  metadata_table['tags'] = processed_tags

  local prop_order = {
    'title',
    'date',
    'author',
    'tags',
    'type',
  }
  local new_lines = {}
  table.insert(new_lines, '---')

  for _, prop in ipairs(prop_order) do
    local val = metadata_table[prop]
    if val then
      if type(val) == 'string' then
        table.insert(new_lines, prop .. ': ' .. val)
      elseif type(val) == 'table' then
        table.insert(new_lines, prop .. ':')
        for _, e in ipairs(val) do
          table.insert(new_lines, '  - ' .. e)
        end
      end
    end
  end

  table.insert(new_lines, '---')

  -- Use Tree-sitter to locate the frontmatter
  local ts = vim.treesitter
  local lang = 'markdown'
  local parser = ts.get_parser(0, lang)
  local tree = parser:parse()[1]
  local root = tree:root()

  local frontmatter_node
  for node in root:iter_children() do
    if node:type() == 'minus_metadata' then
      frontmatter_node = node
      break
    end
  end

  if not frontmatter_node then
    vim.notify('No frontmatter block found', vim.log.levels.WARN)
    vim.api.nvim_buf_set_lines(0, 0, 0, false, new_lines)
    return
  end

  -- Get frontmatter range
  local start_row, start_col, end_row, end_col = frontmatter_node:range()

  -- Replace old frontmatter with new
  vim.api.nvim_buf_set_lines(0, start_row, end_row, false, new_lines)

  return tags
end

local pre_select_executed = false

---Preselect the existing tags
---@param prompt_bufnr integer
---@param init_tags List
local function pre_select(prompt_bufnr, init_tags)
  local action_state = require 'telescope.actions.state'
  local action_utils = require 'telescope.actions.utils'

  if pre_select_executed then
    return
  end
  pre_select_executed = true
  local current_picker = action_state.get_current_picker(prompt_bufnr)

  action_utils.map_entries(prompt_bufnr, function(entry, _, row)
    local entry_hirarchy = vim.split(entry[1], '/')
    local entry_leaf = entry_hirarchy[#entry_hirarchy]
    if init_tags:contains(entry[1]) or init_tags:contains(entry_leaf) then
      current_picker._multi:add(entry)
    end

    if current_picker:can_select_row(row) then
      local caret = current_picker:update_prefix(entry, row)
      if
        current_picker._selection_entry == entry
        and current_picker._selection_row == row
      then
        current_picker.highlighter:hi_selection(row, caret:match '(.*%S)')
      end
      current_picker.highlighter:hi_multiselect(
        row,
        current_picker._multi:is_selected(entry)
      )
    end
  end)
  current_picker:get_status_updater(
    current_picker.prompt_win,
    current_picker.prompt_bufnr
  )()
end

-- Recursive function to flatten hierarchy
M.change_tags = function(opts)
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local sorters = require 'telescope.sorters'
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'
  local action_set = require 'telescope.actions.set'

  local flat_tags = get_all_tags()
  local current_tags = get_current_buf_tags()
  pre_select_executed = false

  opts = opts or {}
  local sorter = sorters.get_generic_fuzzy_sorter()

  pickers
    .new(opts, {
      finder = finders.new_table(flat_tags),
      sorter = sorter,
      multi_select = true, -- Enable multi-select mode
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          pre_select(prompt_bufnr, current_tags)
          local picker = action_state.get_current_picker(prompt_bufnr)
          local new_tags = {}
          for _, entry in pairs(picker._multi:get()) do
            table.insert(new_tags, entry[1])
          end
          actions.close(prompt_bufnr)
          set_current_buf_tags(new_tags)
        end)

        actions.move_selection_previous:replace(function()
          action_set.shift_selection(prompt_bufnr, -1)
          pre_select(prompt_bufnr, current_tags)
        end)

        map('i', '<Tab>', function()
          pre_select(prompt_bufnr, current_tags)
          actions.toggle_selection(prompt_bufnr)
          local picker = action_state.get_current_picker(prompt_bufnr)
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<C-o>d0', true, false, true),
            'i',
            false
          )
        end)
        return true
      end,
    })
    :find()
end

return M
