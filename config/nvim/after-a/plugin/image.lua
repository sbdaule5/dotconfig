-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua'
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua'

-- default config
require('image').setup()

require('img-clip').setup()
