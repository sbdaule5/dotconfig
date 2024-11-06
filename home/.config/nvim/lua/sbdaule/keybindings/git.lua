-- Git mappings
vim.keymap.set('n', '<Leader>gg', ':Git<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>gs', ':Git status<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>gb', ':Git blame<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>gl', ':call GitLog(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>gL', ':call GitLog(0)<CR>', { noremap = true, silent = true })

-- Git gutter mapping
vim.keymap.set('n', 'ghq', ':GitGutterQuickFixCurrentFile | copen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ghQ', ':GitGutterQuickFix | copen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ghp', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghu', '<Plug>(GitGutterUndoHunk)', { noremap = true, silent = true })
vim.keymap.set('n', '[g', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
vim.keymap.set('n', ']g', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
