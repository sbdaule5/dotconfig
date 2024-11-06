local function to_title_case(str)
  return str:gsub("(%a)([%w'-]*)", function(first, rest)
    return string.upper(first) .. string.lower(rest)
  end)
end

local newquicknote = function()
  vim.ui.input({ prompt = 'Title: ' }, function(title)
    local filename = ''
    if title and string.len(title) ~= 0 then
      filename = vim.fs.joinpath('~/notes/quicknotes', string.gsub(title, ' ', '-') .. '.md')
    else
      title = 'Untitled'
      local ts = os.date '%Y-%m-%d-%H-%M'
      filename = vim.fs.joinpath('~/notes/quicknotes', ts .. '.md')
    end

    vim.notify(filename)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(buf, filename)
    vim.api.nvim_set_current_buf(buf)
    vim.bo.buftype = ''
    vim.bo.ft = 'markdown'
    local lines = {
      '---',
      'title: ' .. title,
      'date: ' .. os.date '%Y-%m-%d',
      'author: Shubham <sbdaule5@gmail.com>',
      'type: quicknote',
      '---',
      '',
      '# ' .. to_title_case(title),
      '',
    }
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo.mod = false

    local line_count = vim.api.nvim_buf_line_count(0)
    vim.api.nvim_win_set_cursor(0, { line_count, 0 })
  end)
end

vim.keymap.set('n', '<leader>nq', newquicknote, { silent = true, desc = '[N]ew [Q]uicknote', noremap = true })
