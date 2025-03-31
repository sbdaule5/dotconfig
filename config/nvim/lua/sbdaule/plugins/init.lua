-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- Use `opts = {}` to force a plugin to be loaded.
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'ggandor/leap.nvim',
    opts = {},
    config = function()
      vim.keymap.set('n', 'gl', '<Plug>(leap)')
      vim.keymap.set('n', 'gL', '<Plug>(leap-from-window)')
      vim.keymap.set({ 'x', 'o' }, 'gl', '<Plug>(leap-forward)')
      vim.keymap.set({ 'x', 'o' }, 'gL', '<Plug>(leap-backward)')
    end,
  },
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = {
      padding = true,
      sticky = true,
      ignore = '^$',
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
      },
      -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      post_hook = nil,
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'yochem/jq-playground.nvim',
    opts = {
      cmd = { 'jq' },
    },
  },

  -- { -- Collection of various small independent plugins/modules
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     -- Better Around/Inside textobjects
  --     --
  --     -- Examples:
  --     --  - va)  - [V]isually select [A]round [)]paren
  --     --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  --     --  - ci'  - [C]hange [I]nside [']quote
  --     -- require('mini.ai').setup { n_lines = 500 }

  --     -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --     -- Using surround.nvim like old config
  --     -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --     -- - sd'   - [S]urround [D]elete [']quotes
  --     -- - sr)'  - [S]urround [R]eplace [)] [']
  --     -- require('mini.surround').setup()

  --     -- Simple and easy statusline.
  --     -- use lualine
  --     --  You could remove this setup call if you don't like it,
  --     --  and try some other statusline plugin
  --     -- local statusline = require 'mini.statusline'
  --     -- -- set use_icons to true if you have a Nerd Font
  --     -- statusline.setup { use_icons = vim.g.have_nerd_font }
  --     --
  --     -- -- You can configure sections in the statusline by overriding their
  --     -- -- default behavior. For example, here we set the section for
  --     -- -- cursor location to LINE:COLUMN
  --     -- ---@diagnostic disable-next-line: duplicate-set-field
  --     -- statusline.section_location = function()
  --     --   return '%2l:%-2v'
  --     -- end

  --     -- ... and there is more!
  --     --  Check out: https://github.com/echasnovski/mini.nvim
  --   end,
  -- },
  { 'habamax/vim-godot', event = 'VimEnter' },
}
