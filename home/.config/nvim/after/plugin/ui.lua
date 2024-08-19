local notify = require("notify")
notify.setup({ top_down = false, max_width = 50 })
vim.notify = notify

require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

require("dressing").setup({
    input = {
        enabled = true,
        default_prompt = "Input",
        trim_prompt = true,
        title_pos = "left",
        insert_only = true,
        start_in_insert = true,
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "cursor", -- consider options
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        buf_options = {},
        win_options = {
            wrap = false,
            list = true,
            listchars = "precedes:…,extends:…",
            sidescrolloff = 0,
        },

        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<Up>"] = "HistoryPrev",
                ["<Down>"] = "HistoryNext",
                ["<C-p>"] = "HistoryPrev",
                ["<C-n>"] = "HistoryNext",
            },
        },

        override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
        end,

        -- see :help dressing_get_config
        get_config = nil,
    },
    select = {
        enabled = true,
        backend = { "fzf_lua", "fzf", "telescope", "builtin", "nui" },
        trim_prompt = true,
        telescope = nil,

        fzf_lua = {
            winopts = {
                height = 0.5,
                max_width = { 0.9 },
                min_width = 0.5,
            },
        },

        fzf = {
            window = {
                min_width = 0.5,
                max_width = { 0.9 },
                height = 0.4,
            },
        },

        -- Options for nui Menu
        nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
                style = "rounded",
            },
            buf_options = {
                swapfile = false,
                filetype = "DressingSelect",
            },
            win_options = {
                winblend = 0,
            },
            max_width = 0.90,
            max_height = 40,
            min_width = 60,
            min_height = 10,
        },

        -- Options for built-in selector
        builtin = {
            -- Display numbers for options and set up keymaps
            show_numbers = true,
            -- These are passed to nvim_open_win
            border = "rounded",
            -- 'editor' and 'win' will default to being centered
            relative = "editor",

            buf_options = {},
            win_options = {
                cursorline = true,
                cursorlineopt = "both",
            },

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- the min_ and max_ options can be a list of mixed types.
            -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },

            -- Set to `false` to disable
            mappings = {
                ["<Esc>"] = "Close",
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
            },

            override = function(conf)
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                return conf
            end,
        },

        -- Used to override format_item. See :help dressing-format
        format_item_override = {},

        -- see :help dressing_get_config
        get_config = nil,
    },
})

require("fzf-lua").setup({
    winopts = {
        height = 0.5,
        max_width = { 0.9 },
        min_width = 0.5,
    },
})

require("ufo").setup()
require("outline").setup()
require("headlines").setup()
