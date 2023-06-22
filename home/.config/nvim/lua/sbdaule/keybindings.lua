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
vim.keymap.set("n", "<Leader>R", ":lua Reload()<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "<Leader>i", "i <ESC>r", {noremap = true});

-- Buffer mappings
vim.keymap.set("n", "<Leader>bb", ":Buffers<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bn", ":bn<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bp", ":bp<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bs", ":buffer #<CR>", {noremap = true});

vim.keymap.set("n", "<Leader>s", ":buffer #<CR>", {noremap = true});

-- System clipboard commands
vim.keymap.set("n", "<Leader>cf", ":let @+=@%<CR>:echo  'File Name Copied'<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "<Leader>cl", ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>", {noremap = true, silent = true});
vim.keymap.set("n", [[<Leader>c"]], [[:let @+=@"<CR>]], {noremap = true, silent = true});

vim.keymap.set("n", "<Leader>cp", [["+p]], {noremap = true});
vim.keymap.set("n", "<Leader>cP", [["+P]], {noremap = true});
vim.keymap.set({"n", "v"}, "<Leader>cy", [["+y]], {noremap = true, silent = true});
vim.keymap.set({"n", "v"}, "<Leader>cY", [["+Y]], {noremap = true, silent = true});

vim.keymap.set("n", "yc", [["+y]])
vim.keymap.set("n", "ycc", [["+yy]])
vim.keymap.set("n", "yC", [["+Y]])
vim.keymap.set("n", "ycf", ":let @+=@%<CR>:echo  'File Name Copied'<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "ycl", ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>", {noremap = true, silent = true});

vim.keymap.set("n", "cx", [["_c]])
vim.keymap.set("n", "dx", [["_d]])

-- S for substitute
vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)")
vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)")
vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)")

-- Easy 

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

-- My custom text-objects
vim.keymap.set("o", "aq", "a`");
vim.keymap.set("o", "iq", "i`");

-- Gui keybindings
vim.keymap.set("n", "<Leader>vf", ":lua ChangeView('FileTree')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vu", ":lua ChangeView('UndoTree')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vb", ":lua ChangeView('Buffers')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vt", ":lua ChangeView('Tags')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vg", ":lua ChangeView('GitBlame')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vs", ":lua ChangeView('GitStatus')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vq", ":lua ChangeView('Quickfix')<CR>", {noremap = true});

-- Center screen with regular command
vim.keymap.set("n", "[[", "[[zz", {noremap = true});
vim.keymap.set("n", "]]", "]]zz", {noremap = true});

-- Next and previous commands
vim.keymap.set("n", "[q", ":cprevious<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "]q", ":cnext<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "[g", ":GitGutterPrevHunk<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "]g", ":GitGutterNextHunk<CR>", {noremap = true, silent = true});
