return {

  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-rsi',
  'tpope/vim-speeddating',
  'tpope/vim-abolish',
  'svermeulen/vim-subversive',
  'airblade/vim-gitgutter',
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd [[
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
      ]]
    end,
  },
  'junegunn/vim-slash',

  -- 'junegunn/fzf.vim',
  -- 'junegunn/fzf',
  'junegunn/vim-peekaboo',
  {
    'mbbill/undotree',
    keys = {
      { '<leader>vu', '<cmd>UndotreeToggle<cr>' },
    },
  },
  'lilydjwg/colorizer',
  -- 'sheerun/vim-polyglot',
  -- 'dhruvasagar/vim-table-mode',

  -- Ricing
  -- 'ryanoasis/vim-devicons',

  -- Completions

  -- Fuzzy completions
  -- 'tzachar/fuzzy.nvim',
  -- 'tzachar/cmp-fuzzy-buffer',
  -- 'romgrk/fzy-lua-native',
  -- 'vijaymarupudi/nvim-fzf',
  -- 'ibhagwan/fzf-lua', {'branch': 'main'}

  {
    'lervag/vimtex',
    init = function()
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = './aux',
        out_dir = './out',
      }
    end,
  },
  -- 'untitled-ai/jupyter_ascending.vim',
  -- 'jbyuki/instant.nvim',
  -- 'thosakwe/vim-flutter',
  -- 'mipmip/vim-scimark',
  -- 'diepm/vim-rest-console',
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        auto_load = true, -- whether to automatically load preview when
        -- entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete

        syntax = true, -- enable syntax highlighting, affects performance

        theme = 'dark', -- 'dark' or 'light'

        update_on_change = true,

        app = 'webview', -- 'webview', 'browser', string or a table of strings
        -- explained below

        filetype = { 'markdown', 'vimwiki', 'md', 'vimwiki.md' }, -- list of filetypes to recognize as markdown

        -- relevant if update_on_change is true
        throttle_at = 200000, -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = 'auto', -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
      vim.api.nvim_create_user_command('PeekToggle', function()
        -- local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end, {})
    end,
  },
  {
    'lervag/wiki.vim',
    init = function()
      vim.g.wiki_root = '~/notes'
      vim.g.wiki_journal = {
        name = 'diary',
        frequency = 'daily',
      }
    end,
  },
  -- 'godlygeek/tabular',
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<M-h>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<M-j>', '<cmd>TmuxNavigateDown<cr>' },
      { '<M-k>', '<cmd>TmuxNavigateUp<cr>' },
      { '<M-l>', '<cmd>TmuxNavigateRight<cr>' },
      { '<M-/>', '<cmd>TmuxNavigatePrevious<cr>' },
    },
  },

  -- 'David-Kunz/gen.nvim',
  -- 'bullets-vim/bullets.vim',
  -- 'normen/vim-pio',
  -- 'preservim/vim-markdown',
  -- 'stevearc/vim-arduino',
  -- 'elkowar/yuck.vim',
  'sevko/vim-nand2tetris-syntax',
  --
  -- 'benlubas/molten-nvim',
  -- 'quarto-dev/quarto-nvim',
  -- 'jmbuhr/otter.nvim',
  -- 'GCBallesteros/jupytext.nvim',

  -- Plug 'preservim/tagbar'

  -- My plugins (dev or mod)
  -- '/home/sbdaule/projects/011.nvim-plugins/gpg.nvim',
}
