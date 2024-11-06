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

function diffMode()
  vim.cmd ':diffthis'
end
