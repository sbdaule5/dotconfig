return {
  'Vigemus/iron.nvim',
  opts = {
    config = {
      -- Whether a repl should be discarded or not
      scratch_repl = true,
      -- Your repl definitions come here
      repl_definition = {
        sh = {
          command = { 'zsh' },
        },
        lua = {
          command = { 'lua' },
        },
        python = {
          command = {
            'ipython',
            '--no-autoindent',
          },
          -- format = require('iron.fts.common').bracketed_paste_python,
        },
      },
      -- How the repl window will be displayed
      -- See below for more information
      -- repl_open_cmd = require('iron.view').right '40%',
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
      send_motion = 'gi',
      visual_send = 'gi',
      send_line = 'gii',
      -- send_file = "<leader>xif",
      -- send_paragraph = "<leader>up",
      -- send_until_cursor = "<leader>uu",
      -- send_mark = "<leader>umm",
      -- mark_motion = "<space>umc",
      -- mark_visual = "<space>umc",
      -- remove_mark = "<space>umd",
      cr = 'gi<cr>',
      interrupt = 'gi<C-c>',
      exit = 'giq',
      clear = 'gi<C-l>',
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
      italic = true,
    },
    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
  },
  config = function(_, opts)
    vim.keymap.set('n', '<leader>gii', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<leader>gir', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<leader>gif', '<cmd>IronFocus<cr>')
    vim.keymap.set('n', '<leader>gih', '<cmd>IronHide<cr>')

    opts.config.repl_open_cmd = require('iron.view').right '40%'
    require('iron.core').setup(opts)
  end,
}
