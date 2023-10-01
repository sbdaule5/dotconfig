require("sbdaule.settings")
require("sbdaule.keybindings")
require("sbdaule.view")
require("sbdaule.markdown")
require("sbdaule.jupyter")
require("sbdaule.gitlog")

local function Reload()
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/settings.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/keybindings.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/view.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/markdown.lua]]
end

local M = {
  reload = Reload
}

return M
