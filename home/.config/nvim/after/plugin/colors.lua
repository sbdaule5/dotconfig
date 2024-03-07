scheme = require("tokyonight")

scheme.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night",
  light_style = "storm",
  undercurl = true,
  underline = true,
  transparent = true,     -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent",       -- style for sidebars, see below
    floats = "transparent",         -- style for floating windows
  },
  sidebars = { "help" },            -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,             -- dims inactive windows
  lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

-- scheme.setup({
--   style="storm",
--   light_style = "day",
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "soft", -- can be "hard", "soft" or empty string
--   dim_inactive = false,
--   transparent = true,
-- })

function ColorMyPencils(color)
  vim.cmd("colorscheme tokyonight")
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
  -- vim.cmd [[highlight NormalFloat guifg=#ebdbb2 guibg=#3c3836]]
  vim.cmd [[highlight! link TreesitterContextLineNumber GruvboxOrangeBold]]
  vim.cmd [[highlight! TreesitterContext guibg=none]]
  -- 	-- vim.cmd [[highlight FloatBorder guifg=white guibg=#1f2335]]
  -- 	vim.cmd [[highlight WinSeparator cterm=NONE ctermbg=None ctermbg=gray guibg=None guifg=gray]]
end

ColorMyPencils()
