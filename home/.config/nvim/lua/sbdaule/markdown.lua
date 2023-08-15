-- This file contains keybindings and settings that I use specifically when using with markdown
-- All the keybindings will start with <Leader>m

-- Some convenience shortcuts
vim.keymap.set("n", "<Leader>mf", "ysiw`", {remap = true});
vim.keymap.set("n", "<Leader>mF", "ysiW`", {remap = true});

function vimwikiKeybindings()
  vim.keymap.set("n", "<Leader>mf", "ysiw`", {remap = true});
  vim.keymap.set("n", "<Leader>mF", "ysiW`", {remap = true});
  vim.keymap.set("n", "<Leader>w<leader>p", "<Plug>VimwikiDiaryPrevDay", {remap = false});
  vim.keymap.set("n", "<Leader>w<leader>n", "<Plug>VimwikiDiaryNextDay", {remap = false});
end
