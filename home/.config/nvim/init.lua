local myconfig = require("sbdaule")

function Reload() vim.cmd [[luafile ~/.config/nvim/init.lua]]
  vim.cmd("luafile ~/.config/nvim/lua/sbdaule/init.lua")
  myconfig.reload()
end

xdg_config_home = os.getenv("XDG_CONFIG_HOME")
if xdg_config_home ~= nil then
  xdg_config_home = os.getenv("HOME").."/.config"
end
file = io.open(xdg_config_home.."/nvim/vimscript.vim")
if file ~= nil then
  vim.cmd(file:read("*a"))
else
  vim.api.nvim_err_writeln("File vimscript.vim does not exist")
end
