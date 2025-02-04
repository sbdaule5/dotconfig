scheme = require 'tokyonight'

scheme.setup {}

function ColorMyPencils(color)
  vim.cmd 'colorscheme tokyonight'
  vim.cmd [[highlight! link TreesitterContextLineNumber GruvboxOrangeBold]]
  vim.cmd [[highlight! TreesitterContext guibg=none]]
end

ColorMyPencils()
