scheme = require("tokyonight")

scheme.setup({
    style = "night",
    light_style = "storm",
    undercurl = true,
    underline = true,
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    sidebars = { "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

    ---@param colors ColorScheme
    on_colors = function(colors) end,

    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})

function ColorMyPencils(color)
    vim.cmd("colorscheme tokyonight")
    vim.cmd([[highlight! link TreesitterContextLineNumber GruvboxOrangeBold]])
    vim.cmd([[highlight! TreesitterContext guibg=none]])
end

ColorMyPencils()
