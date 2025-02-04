return {
  {
    'rcarriga/nvim-notify',
    opts = { top_down = false, max_width = 50 },
    config = function()
      vim.notify = require 'notify'
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        enabled = true,
        default_prompt = 'Input',
        trim_prompt = true,
        title_pos = 'left',
        insert_only = true,
        start_in_insert = true,
        border = 'rounded',
        -- 'editor' and 'win' will default to being centered
        relative = 'cursor', -- consider options
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        buf_options = {},
        win_options = {
          wrap = false,
          list = true,
          listchars = 'precedes:…,extends:…',
          sidescrolloff = 0,
        },

        mappings = {
          n = {
            ['<Esc>'] = 'Close',
            ['<CR>'] = 'Confirm',
          },
          i = {
            ['<C-c>'] = 'Close',
            ['<CR>'] = 'Confirm',
            ['<Up>'] = 'HistoryPrev',
            ['<Down>'] = 'HistoryNext',
            ['<C-p>'] = 'HistoryPrev',
            ['<C-n>'] = 'HistoryNext',
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
        backend = { 'fzf_lua', 'fzf', 'telescope', 'builtin', 'nui' },
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
          position = '50%',
          size = nil,
          relative = 'editor',
          border = {
            style = 'rounded',
          },
          buf_options = {
            swapfile = false,
            filetype = 'DressingSelect',
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
          border = 'rounded',
          -- 'editor' and 'win' will default to being centered
          relative = 'editor',

          buf_options = {},
          win_options = {
            cursorline = true,
            cursorlineopt = 'both',
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
            ['<Esc>'] = 'Close',
            ['<C-c>'] = 'Close',
            ['<CR>'] = 'Confirm',
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
    },
  },

  -- require('fzf-lua').setup {
  --   winopts = {
  --     height = 0.5,
  --     max_width = { 0.9 },
  --     min_width = 0.5,
  --   },
  -- },
  {
    'kevinhwang91/nvim-ufo',
    opts = {
      filetype_exclude = { 'help', 'dashboard', 'NvimTree', 'lazy', 'mason' },
      preview = {
        win_config = {
          border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']',
        },
      },
    },
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'VeryLazy',
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function()
          require('ufo').detach()
        end,
      })

      vim.opt.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zK', function()
        require('ufo').peekFoldedLinesUnderCursor()
      end)
      require('ufo').setup(opts)
    end,
  },
  'kevinhwang91/nvim-bqf',
  {
    'hedyhli/outline.nvim',
    opts = {},
  },
  -- require('headlines').setup(),
  {
    'arnarg/todotxt.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      todo_file = '~/notes/todo.txt',
    },
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
