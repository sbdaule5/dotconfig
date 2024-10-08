vim.g.mapleader = " "

-- use leader key bindings
-- Navigation
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

vim.keymap.set("n", "<Leader>r", ":lua Reload()<CR>", { noremap = true, silent = true })

-- Delete buffer on ZQ
vim.keymap.set("n", "ZQ", ":bd %<CR>", { noremap = true })

-- Buffer mappings
vim.keymap.set("n", "<Leader>bb", "<cmd>FzfLua buffers resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>bv", "<cmd>FzfLua buffers resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>bn", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bp", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bs", ":buffer #<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bh", ":ClangdSwitchSourceHeader<CR>", { noremap = true })

-- vim.keymap.set("n", "<Leader>s", ":buffer #<CR>", {noremap = true}); -- No longer in use
vim.keymap.set({ "n", "v" }, "<Leader>sf", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout = 500,
    })
end)

-- f for fuzzy
vim.keymap.set("n", "<Leader>ff", "<cmd>FzfLua files resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>ft", "<cmd>FzfLua tags resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fb", "<cmd>FzfLua buffers resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fl", "<cmd>FzfLua lines resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fm", "<cmd>FzfLua man_pages resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fj", "<cmd>FzfLua jumps resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fh", "<cmd>FzfLua help_tags resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fo", "<cmd>FzfLua oldfiles resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fr", "<cmd>FzfLua grep resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fq", "<cmd>FzfLua quickfix resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fs", "<cmd>FzfLua lsp_workspace_symbols resume=false<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fd", ":lua dotfiles()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fx", ":OverseerRun<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fa", ":Gen<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>fT", ':Tags "<CR>', { noremap = true })

vim.keymap.set("n", "<Leader>fgc", "<cmd>FzfLua git_commits resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fgb", "<cmd>FzfLua git_bcommits resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fgf", "<cmd>FzfLua git_files resume=true<cr>", { noremap = true })
vim.keymap.set("n", "<Leader>fgs", "<cmd>FzfLua git_status resume=true<cr>", { noremap = true })

-- Git mappings
vim.keymap.set("n", "<Leader>gg", ":Git<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gs", ":Git status<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gl", ":call GitLog(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gL", ":call GitLog(0)<CR>", { noremap = true, silent = true })

-- Git gutter mapping
vim.keymap.set("n", "ghq", ":GitGutterQuickFixCurrentFile | copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ghQ", ":GitGutterQuickFix | copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ghp", "<Plug>(GitGutterPreviewHunk)", { noremap = true, silent = true })
vim.keymap.set("n", "ghs", "<Plug>(GitGutterStageHunk)", { noremap = true, silent = true })
vim.keymap.set("n", "ghu", "<Plug>(GitGutterUndoHunk)", { noremap = true, silent = true })
vim.keymap.set("n", "[g", "<Plug>(GitGutterPrevHunk)", { noremap = true, silent = true })
vim.keymap.set("n", "]g", "<Plug>(GitGutterNextHunk)", { noremap = true, silent = true })

-- System clipboard commands
vim.keymap.set("n", "<Leader>cf", ":let @+=@%<CR>:echo  'File Name Copied'<CR>", { noremap = true, silent = true })
vim.keymap.set(
    "n",
    "<Leader>cl",
    ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>",
    { noremap = true, silent = true }
)
vim.keymap.set("n", [[<Leader>c"]], [[:let @+=@"<CR>]], { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>cp", [["+p]], { noremap = true })
vim.keymap.set("n", "<Leader>cP", [["+P]], { noremap = true })
vim.keymap.set({ "n", "v" }, "<Leader>cy", [["+y]], { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>cY", [["+y$]], { noremap = true, silent = true })

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "yc", [["+y]])
vim.keymap.set("n", "ycc", [["+yy]])
vim.keymap.set("n", "yC", [["+y$]])
vim.keymap.set("n", "ycf", ":let @+=@%<CR>:echo  'File Name Copied'<CR>", { noremap = true, silent = true })
vim.keymap.set(
    "n",
    "ycl",
    ":let @+ = expand('%') . ':' . line('.')<CR>:echo  'Line Number Copied'<CR>",
    { noremap = true, silent = true }
)

vim.keymap.set("n", "cx", [["_c]])
vim.keymap.set("n", "dx", [["_d]])
-- Unused and gr does same
-- vim.keymap.set("x", "<Leader>p", [["_p]])
-- vim.keymap.set("x", "<Leader>P", [["_P]])

-- gr for substitute
vim.keymap.set("n", "gr", "<plug>(SubversiveSubstitute)")
vim.keymap.set("n", "grr", "<plug>(SubversiveSubstituteLine)")
vim.keymap.set("n", "gR", "<plug>(SubversiveSubstituteToEndOfLine)")
vim.keymap.set("n", "grc", [["+<plug>(SubversiveSubstitute)]])
vim.keymap.set("n", "grcc", [["+<plug>(SubversiveSubstituteLine)]])
vim.keymap.set("n", "grC", [["+<plug>(SubversiveSubstituteToEndOfLine)]])
vim.keymap.set("v", "gr", "<plug>(SubversiveSubstitute)")

-- insert a blank line
vim.keymap.set("n", "<Leader><CR>", "i<CR><ESC>", { noremap = true })
vim.keymap.set("n", "<Leader>o", "o<ESC>", { noremap = true })
vim.keymap.set("n", "<Leader>O", "O<ESC>", { noremap = true })

-- Run will change based on project and will be retained due to Session.vim
-- x as in execute
-- Arduino commands
local executeCommandGroups = {
    c = vim.api.nvim_create_augroup("execute_commands_c", { clear = true }),
    arduino = vim.api.nvim_create_augroup("execute_commands_arduino", { clear = true }),
}
-- vim.api.nvim_create_autocmd("FileType", {
--     callback = function()
--         vim.g.SingleCompile_showresultafterrun = 1
--         vim.g.SingleCompile_silentcompileifshowquickfix = 1
--         vim.g.SingleCompile_showquickfixiferror = 1

--         vim.keymap.set("n", "<Leader>xc", ":SingleCompile-silentcompileifshowquickfix<CR>")
--         -- vim.keymap.set('n', "<Leader>xx", ":SCCompileRun<CR>");
--         vim.keymap.set("n", "<Leader>xc", ":SCCompile<CR>")
--         vim.keymap.set("n", "<Leader>xv", ":SCViewResult<CR>")
--         vim.keymap.set("n", "<Leader>xp", ":lua ChangeView('cp')<CR>")
--     end,
--     group = executeCommandGroups["c"],
--     pattern = { "c", "cpp", "rust", "python" },
-- })
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.keymap.set("n", "<Leader>xa", ":terminal")
    end,
    group = executeCommandGroups["arduino"],
    pattern = "arduino",
})
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- Jupyter keybindings
        -- Creating blocks
        vim.keymap.set("n", "<Leader>oc", ":lua JupyterNewBlock('code', false)<CR>", { noremap = true, silent = true })
        vim.keymap.set(
            "n",
            "<Leader>om",
            ":lua JupyterNewBlock('markdown', false)<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set("n", "<Leader>Oc", ":lua JupyterNewBlock('code', true)<CR>", { noremap = true, silent = true })
        vim.keymap.set(
            "n",
            "<Leader>Om",
            ":lua JupyterNewBlock('markdown', true)<CR>",
            { noremap = true, silent = true }
        )
        -- Executing code
        vim.keymap.set("n", "<space>xx", "<Plug>JupyterExecute")
        vim.keymap.set("n", "<space>X", "<Plug>JupyterExecuteAll")
        vim.keymap.set("n", "<space>xr", "<Plug>JupyterRestart")
    end,
    group = executeCommandGroups[".sync.py"],
    pattern = "python",
})

vim.keymap.set("n", "<Leader>xF", ":CompilerOpen<CR>")
vim.keymap.set("n", "<Leader>xf", ":OverseerRun<CR>")
vim.keymap.set("n", "<Leader>xx", ":OverseerQuickAction restart<CR>")
vim.keymap.set("n", "<Leader>xp", ":OverseerQuickAction open float<CR>")
vim.keymap.set("n", "<Leader>xq", ":OverseerQuickAction<CR>")
vim.keymap.set("n", "<Leader>xo", ":OverseerLoadBundle<CR>")

-- Info bindings
vim.keymap.set("n", "<Leader>il", ":LspInfo<CR>")
vim.keymap.set("n", "<Leader>if", ":ConformInfo<CR>")

-- use leader / to stop highlighting
vim.keymap.set("n", "<Leader>/", ":noh<CR>", { noremap = true, silent = true })

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

-- Gui keybindings
vim.keymap.set("n", "<Leader>vf", ":lua ChangeView('FileTree')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vu", ":lua ChangeView('UndoTree')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vq", ":lua ChangeView('Quickfix')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vd", ":lua ChangeView('Dashboard')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vo", ":lua ChangeView('Overseer')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vt", ":lua ChangeView('Tagbar')<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>vb", ":lua ChangeView('db')<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":lua ViewFocusLeft()<CR>", { noremap = true, silent = true })

-- Tab keybindings
vim.keymap.set("n", "<Leader>td", ":tabe | Dashboard<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tn", ":tabe<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tb", ":tabe %<CR>", { noremap = true })

-- Center screen with regular command
vim.keymap.set("n", "[[", "[[zz", { noremap = true })
vim.keymap.set("n", "]]", "]]zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-d>zz", { noremap = true })

-- Next and previous commands
vim.keymap.set("n", "[q", ":cprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true })

-- Terminal keymappings
-- vim.keymap.set("t", "<Esc><leader>", "<C-\\><C-n> ", { noremap = false, silent = true });
vim.keymap.set("n", "z=", "<cmd>FzfLua spell_suggest resume=true<cr>", { noremap = true, silent = true })
