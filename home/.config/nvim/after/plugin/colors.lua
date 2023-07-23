scheme = require("gruvbox")

scheme.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  dim_inactive = false,
  transparent_mode = true,
})

function ColorMyPencils(color) 
    vim.cmd("colorscheme gruvbox")
	-- color = color or "gruvbox"
	-- vim.cmd.colorscheme(color)

    -- If transparency is not supported by scheme:
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- 	vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" , fg=scheme.pro.gutter_add})
-- 	vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none" , fg=scheme.pro.gutter_change})
-- 	vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none" , fg=scheme.pro.gutter_remove})
--  vim.api.nvim_set_hl(0, "WinSeperator", { bg = "none", fg=scheme.pro.black})
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = scheme.gray})
-- 	vim.api.nvim_set_hl(0, "FloatBorder ", { bg = "none", fg=scheme.pro.black})
	vim.cmd [[highlight NormalFloat guifg=#ebdbb2 guibg=#3c3836]]
	vim.cmd [[highlight! link TreesitterContextLineNumber GruvboxOrangeBold]]
	vim.cmd [[highlight! TreesitterContext guibg=none]]
-- 	-- vim.cmd [[highlight FloatBorder guifg=white guibg=#1f2335]]
-- 	vim.cmd [[highlight WinSeparator cterm=NONE ctermbg=None ctermbg=gray guibg=None guifg=gray]]

end

ColorMyPencils()
