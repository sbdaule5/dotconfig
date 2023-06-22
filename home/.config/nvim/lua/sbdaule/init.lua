require("sbdaule/settings")
require("sbdaule/keybindings")
require("sbdaule/view")

local function Reload()
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/settings.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/keybindings.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/view.lua]]
end

local M = {
  reload = Reload
}

return M
