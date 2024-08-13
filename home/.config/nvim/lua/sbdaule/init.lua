require("sbdaule.settings")
require("sbdaule.keybindings")
require("sbdaule.view")
require("sbdaule.markdown")
require("sbdaule.jupyter")
require("sbdaule.gitlog")
require("sbdaule.autocommands")

local function reloadPluginConfigs()
    vim.cmd([[luafile ~/.config/nvim/after/plugin/ai.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/build.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/colors.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/comment.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/completions.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/dashboard.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/db.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/formatter.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/fuzzy.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/ibl.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/lsp.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/lualine.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/nvim-tree.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/peek.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/treesitter.lua]])
    vim.cmd([[luafile ~/.config/nvim/after/plugin/ui.lua]])
end

local function Reload()
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/autocommands.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/gitlog.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/jupyter.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/keybindings.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/markdown.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/settings.lua]])
    vim.cmd([[luafile ~/.config/nvim/lua/sbdaule/view.lua]])
    reloadPluginConfigs()
end

local M = {
    reload = Reload,
}

return M
