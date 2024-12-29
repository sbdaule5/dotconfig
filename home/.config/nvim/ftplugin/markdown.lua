local function linkFile()
  vim.notify("Not Implemented")
end

vim.opt.spell = true
vim.opt.expandtab = true

vim.keymap.set('n', '<Leader>pi', '<cmd>PasteImage<cr>', { desc = 'Paste Image from clipboard' })
vim.keymap.set('n', '<Leader>pl', 'i[link]()PF]hci[', { desc = 'Paste Link from clipboard' })
vim.keymap.set('n', '<Leader>pL', 'i[link]()"+PF]hci[', { desc = 'Paste Link from clipboard' })
vim.keymap.set('n', '<Leader>mlf', linkFile, { desc = 'Paste Link from clipboard' })
