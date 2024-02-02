local myconfig = require("sbdaule")

function Reload() vim.cmd [[luafile ~/.config/nvim/init.lua]]
  vim.cmd("luafile ~/.config/nvim/lua/sbdaule/init.lua")
  myconfig.reload()
end

xdg_config_home = os.getenv("XDG_CONFIG_HOME")
if xdg_config_home ~= nil then
  xdg_config_home = os.getenv("HOME").."/.config"
end

local vimFiles = {"vimscript.vim", "notes.vim"}

for _,vimFile in ipairs(vimFiles) do
  local fullFilePath = xdg_config_home..'/nvim/'..vimFile
  local file = io.open(fullFilePath)
  if file ~= nil then
    vim.cmd(file:read("*a"))
    io.close(file)
  else
    vim.api.nvim_err_writeln("File "..fullFilePath.." does not exist")
  end
end
