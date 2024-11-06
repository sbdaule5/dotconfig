require('sbdaule.keybindings.clipboard')
require('sbdaule.keybindings.windows')
require('sbdaule.keybindings.git')


-- Center screen with regular command
vim.keymap.set("n", "[[", "[[zz", { noremap = true })
vim.keymap.set("n", "]]", "]]zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-d>zz", { noremap = true })

-- Next and previous commands
vim.keymap.set("n", "[q", ":cprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true })

-- My custom text-objects
vim.keymap.set("o", "aq", "a`")
vim.keymap.set("o", "iq", "i`")

vim.keymap.set("o", "ii", ":<C-U>cal IndTxtObj(1)<CR>", { silent = true })
vim.keymap.set("o", "ai", ":<C-U>cal IndTxtObj(0)<CR>", { silent = true })
vim.keymap.set("v", "ii", ":<C-U>cal IndTxtObj(1)<CR><Esc>gv", { silent = true, noremap = true })
vim.keymap.set("v", "ai", ":<C-U>cal IndTxtObj(0)<CR><Esc>gv", { silent = true, noremap = true })
vim.keymap.set("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)", { silent = true, noremap = true })
vim.keymap.set("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)", { silent = true, noremap = true })
vim.keymap.set("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)", { silent = true, noremap = true })
vim.keymap.set("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)", { silent = true, noremap = true })
