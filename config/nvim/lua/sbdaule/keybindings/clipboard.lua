-- System clipboard commands
vim.keymap.set('n', '<Leader>cf', ":let @+=@%<CR>:echo  'File Name Copied'<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>cl', ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>", { noremap = true, silent = true })
vim.keymap.set('n', [[<Leader>c"]], [[:let @+=@"<CR>]], { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>cp', [["+p]], { noremap = true })
vim.keymap.set('n', '<Leader>cP', [["+P]], { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>cy', [["+y]], { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>cY', [["+y$]], { noremap = true, silent = true })

vim.keymap.set('v', '<leader>y', [["+y]])
vim.keymap.set('v', '<leader>yy', [["+yy]])
vim.keymap.set('n', 'yc', [["+y]])
vim.keymap.set('n', 'ycc', [["+yy]])
vim.keymap.set('n', 'yC', [["+y$]])
vim.keymap.set('n', 'ycf', ":let @+=@%<CR>:echo  'File Name Copied'<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'ycl', ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>", { noremap = true, silent = true })

vim.keymap.set('n', 'cx', [["_c]])
vim.keymap.set('n', 'dx', [["_d]])
-- Unused and gr does same
-- vim.keymap.set("x", "<Leader>p", [["_p]])
-- vim.keymap.set("x", "<Leader>P", [["_P]])

-- gr for substitute
vim.keymap.set('n', 'gr', '<plug>(SubversiveSubstitute)')
vim.keymap.set('n', 'grr', '<plug>(SubversiveSubstituteLine)')
vim.keymap.set('n', 'gR', '<plug>(SubversiveSubstituteToEndOfLine)')
vim.keymap.set('n', 'grc', [["+<plug>(SubversiveSubstitute)]])
vim.keymap.set('n', 'grcc', [["+<plug>(SubversiveSubstituteLine)]])
vim.keymap.set('n', 'grC', [["+<plug>(SubversiveSubstituteToEndOfLine)]])
vim.keymap.set('v', 'gr', '<plug>(SubversiveSubstitute)')
