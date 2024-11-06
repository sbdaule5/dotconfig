vim.keymap.set("n", "<Leader>>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<Leader><", ":tabprevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", "<C-w>", { silent = true })

vim.keymap.set("n", "<Leader>H", "<C-w>H", { noremap = true })
vim.keymap.set("n", "<Leader>J", "<C-w>J", { noremap = true })
vim.keymap.set("n", "<Leader>K", "<C-w>K", { noremap = true })
vim.keymap.set("n", "<Leader>L", "<C-w>L", { noremap = true })

vim.keymap.set("n", "<Leader>1", "1gt", { noremap = true })
vim.keymap.set("n", "<Leader>2", "2gt", { noremap = true })
vim.keymap.set("n", "<Leader>3", "3gt", { noremap = true })
vim.keymap.set("n", "<Leader>4", "4gt", { noremap = true })
vim.keymap.set("n", "<Leader>5", "5gt", { noremap = true })
vim.keymap.set("n", "<Leader>6", "6gt", { noremap = true })
vim.keymap.set("n", "<Leader>7", "7gt", { noremap = true })
vim.keymap.set("n", "<Leader>8", "8gt", { noremap = true })
vim.keymap.set("n", "<Leader>9", "9gt", { noremap = true })


vim.keymap.set("n", "<Leader>vq", "<cmd>copen<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vd", "<cmd>Dashboard<CR>", { noremap = true })
-- vim.keymap.set("n", "<Leader>vt", ":lua ChangeView('Tagbar')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vb", "<cmd>DBUI<CR>", { noremap = true })

-- Tab keybindings
vim.keymap.set("n", "<Leader>td", ":tabe | Dashboard<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tn", ":tabe<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tb", ":tabe %<CR>", { noremap = true })
