vim.g.mapleader = ' '

-- use leader key bindings
-- Navigation
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

vim.keymap.set("n", "<Leader>1", "1gt", {noremap = true});
vim.keymap.set("n", "<Leader>2", "2gt", {noremap = true});
vim.keymap.set("n", "<Leader>3", "3gt", {noremap = true});
vim.keymap.set("n", "<Leader>4", "4gt", {noremap = true});
vim.keymap.set("n", "<Leader>5", "5gt", {noremap = true});
vim.keymap.set("n", "<Leader>6", "6gt", {noremap = true});
vim.keymap.set("n", "<Leader>7", "7gt", {noremap = true});
vim.keymap.set("n", "<Leader>8", "8gt", {noremap = true});
vim.keymap.set("n", "<Leader>9", "9gt", {noremap = true});

vim.keymap.set("n", "<Leader>R", ":Rename<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>r", ":lua Reload()<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "<Leader>i", "i <ESC>r", {noremap = true});

-- Delete buffer on ZQ
vim.keymap.set("n", "ZQ", ":bd %<CR>", {noremap = true});

-- Buffer mappings
vim.keymap.set("n", "<Leader>bb", ":Buffers<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bv", ":lua ChangeView('Buffers')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bn", ":bn<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bp", ":bp<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bs", ":buffer #<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>bh", ":ClangdSwitchSourceHeader<CR>", {noremap = true});

vim.keymap.set("n", "<Leader>s", ":buffer #<CR>", {noremap = true});

-- f for fuzzy
vim.keymap.set("n", "<Leader>ff", ":Files<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>ft", ":Tags<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fb", ":Buffers<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fl", ":Lines<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fm", ":Marks<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fj", ":Jumps<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fh", ":Helptags<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fo", ":History<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fd", ":lua dotfiles()<CR>", {noremap = true});

vim.keymap.set("n", "<Leader>fT", ":Tags \"<CR>", {noremap = true});

vim.keymap.set("n", "<Leader>fgc", ":Commits<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fgb", ":BCommits<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fgf", ":GFiles<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>fgs", ":GFiles?<CR>", {noremap = true});

-- Git mappings
vim.keymap.set("n", "<Leader>gg", ":Git<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>gs", ":Git status<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", {noremap = true});

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
vim.keymap.set("x", "<Leader>p", [["_p]])
vim.keymap.set("x", "<Leader>P", [["_P]])

-- S for substitute
vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)")
vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)")
vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)")
vim.keymap.set("n", "sc", [["+s]])
vim.keymap.set("n", "scc", [["+ss]])
vim.keymap.set("n", "sC", [["+s]])

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

vim.keymap.set("o", "ii", ":<C-U>cal IndTxtObj(1)<CR>", {silent = true});
vim.keymap.set("o", "ai", ":<C-U>cal IndTxtObj(0)<CR>", {silent = true});
vim.keymap.set("v", "ii", ":<C-U>cal IndTxtObj(1)<CR><Esc>gv", {silent = true, noremap = true});
vim.keymap.set("v", "ai", ":<C-U>cal IndTxtObj(0)<CR><Esc>gv", {silent = true, noremap = true});

vim.keymap.set("v", "af", ":<C-U>?^{$<CR>V/^}$<CR>", {silent = true});
vim.keymap.set("v", "if", ":<C-U>?^{$<CR>jV/^}$<CR>k", {silent = true});
vim.keymap.set("o", "af", ":normal Vaf<CR>", {silent = true});
vim.keymap.set("o", "if", ":normal Vif<CR>", {silent = true});


-- Gui keybindings
vim.keymap.set("n", "<Leader>vf", ":lua ChangeView('FileTree')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vu", ":lua ChangeView('UndoTree')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vb", ":lua ChangeView('Buffers')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vt", ":lua ChangeView('Tags')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vg", ":lua ChangeView('GitStatus')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vq", ":lua ChangeView('Quickfix')<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>vd", ":lua ChangeView('Dashboard')<CR>", {noremap = true});

-- Tab keybindings
vim.keymap.set("n", "<Leader>td", ":tabe | Dashboard<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>tn", ":tabe<CR>", {noremap = true});
vim.keymap.set("n", "<Leader>tb", ":tabe %<CR>", {noremap = true});

-- Center screen with regular command
vim.keymap.set("n", "[[", "[[zz", {noremap = true});
vim.keymap.set("n", "]]", "]]zz", {noremap = true});
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true});
vim.keymap.set("n", "<C-u>", "<C-d>zz", {noremap = true});


-- Next and previous commands
vim.keymap.set("n", "[q", ":cprevious<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "]q", ":cnext<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "[g", ":GitGutterPrevHunk<CR>", {noremap = true, silent = true});
vim.keymap.set("n", "]g", ":GitGutterNextHunk<CR>", {noremap = true, silent = true});
