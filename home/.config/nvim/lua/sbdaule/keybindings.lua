vim.g.mapleader = ' '

-- use leader key bindings
vim.keymap.set("n", "<Leader>>", ":tabnext<CR>", {silent = true})
vim.keymap.set("n", "<Leader><", ":tabprevious<CR>", {silent = true})
vim.keymap.set("n", "<Leader>w", "<C-w>", {silent = true})

vim.keymap.set("n", "<Leader>h", "<C-w>h", {noremap = true});
vim.keymap.set("n", "<Leader>j", "<C-w>j", {noremap = true});
vim.keymap.set("n", "<Leader>k", "<C-w>k", {noremap = true});
vim.keymap.set("n", "<Leader>l", "<C-w>l", {noremap = true});

vim.keymap.set("n", "<Leader>H", "<C-w>H", {noremap = true});
vim.keymap.set("n", "<Leader>J", "<C-w>J", {noremap = true});
vim.keymap.set("n", "<Leader>K", "<C-w>K", {noremap = true});
vim.keymap.set("n", "<Leader>L", "<C-w>L", {noremap = true});

vim.keymap.set("n", "<Leader>r", ":Rename<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>i", "i <ESC>r", {noremap = true});
vim.keymap.set("n", "<Leader>b", ":Buffers<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>s", ":buffer #<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>p", ":r! xsel -o -b<CR>", {noremap = true});
vim.keymap.set({"n", "v"}, "<Leader>y", [["+y]], {noremap = true});
vim.keymap.set({"n", "v"}, "<Leader>Y", [["+Y]], {noremap = true});

-- insert a blank line
vim.keymap.set("n", "<Leader><CR>", "i<CR><ESC>", {noremap = true});
vim.keymap.set("n", "<Leader>o", "o<ESC>", {noremap = true});
vim.keymap.set("n", "<Leader>O", "O<ESC>", {noremap = true});

-- Run will change based on project and will be retained due to Session.vim
-- x as in execute
vim.keymap.set("n", "<Leader>x", ":Run<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>X", ":RunAlt<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>z", ":Build<CR>", {noremap = true});

-- use leader / to stop highlighting
vim.keymap.set("n", "<Leader>/", ":noh<CR>", {noremap = true, silent = true});

