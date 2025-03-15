-- Conceal mappings
function changeConceal()
  if vim.opt.conceallevel._value == 0 then
    vim.opt.conceallevel = 2
  else
    vim.opt.conceallevel = 0
  end
end

vim.keymap.set('n', '<leader>uh', changeConceal, { silent = true, desc = 'Toggle conceallevel (0 and 2)', noremap = true })

-- Diff mappings
vim.keymap.set('n', '<leader>udt', ':diffthis<CR>', { silent = true, desc = 'Enable diff on current file', noremap = true })
vim.keymap.set('n', '<leader>udo', ':diffoff<CR>', { silent = true, desc = 'Disable diff on current file', noremap = true })
vim.keymap.set('n', '<leader>uda', ':diffoff!<CR>', { silent = true, desc = 'Disable diff on all file', noremap = true })

local dynamic_diff_count = 0

local function diffClipboard()
  -- TODO: Fix bugs
  -- Get the selected text
  local _, ls, cs = unpack(vim.fn.getpos "'<") -- Start line and column
  local _, le, ce = unpack(vim.fn.getpos "'>") -- End line and column
  vim.notify(ls .. ', ' .. cs .. 'to ' .. le .. ', ' .. ce)
  -- local lines = vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {})
  local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)

  -- If selection is on a single line, extract the correct range
  if #lines == 1 then
    lines[1] = string.sub(lines[1], cs, ce)
  else
    lines[1] = string.sub(lines[1], cs)
    lines[#lines] = string.sub(lines[#lines], 1, ce)
  end

  local selected_text = table.concat(lines, '\n')
  local clipboard_text = vim.fn.getreg '+'

  -- Create two new split windows at the bottom
  vim.cmd 'diffoff!'
  vim.cmd 'botright split'
  local buf1 = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf1, 'Diff_Selection_' .. dynamic_diff_count)
  vim.api.nvim_set_current_buf(buf1)
  vim.api.nvim_buf_set_lines(buf1, 0, -1, false, vim.split(selected_text, '\n'))
  vim.cmd 'diffthis'

  vim.cmd 'vert split'
  local buf2 = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf2, 'Diff_Clipboard_' .. dynamic_diff_count)
  vim.api.nvim_set_current_buf(buf2)
  vim.api.nvim_buf_set_lines(buf2, 0, -1, false, vim.split(clipboard_text, '\n'))
  vim.cmd 'diffthis'

  dynamic_diff_count = dynamic_diff_count + 1

  -- Enable diff mode
  -- vim.cmd 'wincmd p'
  -- vim.cmd 'diffthis'
  -- vim.cmd 'wincmd w'
  -- vim.cmd 'diffthis'

  -- vim.api.nvim_create_autocmd('WinClosed', {
  --   buffer = {buf1, buf2},
  --   callback = function()
  --     -- vim.fn.winrestview(win_layout)
  --   end,
  -- })

end

vim.keymap.set('v', '<leader>udc', diffClipboard, { silent = true, desc = 'Diff current selection with system clipboard', noremap = true })

function diffMode()
  vim.cmd ':diffthis'
end
