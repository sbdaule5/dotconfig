return {
  {
    'kwkarlwang/bufresize.nvim',
    config = function()
      local opts = { noremap = true, silent = true }
      require('bufresize').setup {
        register = {
          keys = {
            { 'n', '<leader>w<', '30<C-w><', opts },
            { 'n', '<leader>w>', '30<C-w>>', opts },
            { 'n', '<leader>w+', '10<C-w>+', opts },
            { 'n', '<leader>w-', '10<C-w>-', opts },
          },
          trigger_events = { 'BufWinEnter', 'WinEnter' },
        },
        resize = {
          keys = {},
          trigger_events = { 'VimResized' },
          increment = 5,
        },
      }
    end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    dependencies = { 'kwkarlwang/bufresize.nvim' },
    opts = {
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = {
        'nofile',
        'quickfix',
        'prompt',
      },
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = { 'NvimTree', 'dashboard' },
      -- the default number of lines/columns to resize by at a time
      default_amount = 3,
      -- Desired behavior when your cursor is at an edge and you
      -- are moving towards that same edge:
      -- 'wrap' => Wrap to opposite side
      -- 'split' => Create a new split in the desired direction
      -- 'stop' => Do nothing
      -- function => You handle the behavior yourself
      -- NOTE: If using a function, the function will be called with
      -- a context object with the following fields:
      -- {
      --    mux = {
      --      type:'tmux'|'wezterm'|'kitty'|'zellij'
      --      current_pane_id():number,
      --      is_in_session(): boolean
      --      current_pane_is_zoomed():boolean,
      --      -- following methods return a boolean to indicate success or failure
      --      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
      --      next_pane(direction:'left'|'right'|'up'|'down'):boolean
      --      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
      --      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
      --    },
      --    direction = 'left'|'right'|'up'|'down',
      --    split(), -- utility function to split current Neovim pane in the current direction
      --    wrap(), -- utility function to wrap to opposite Neovim pane
      -- }
      -- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
      -- multiplexer, as there is no way to determine layout via the CLI
      at_edge = 'wrap',
      -- Desired behavior when the current window is floating:
      -- 'previous' => Focus previous Vim window and perform action
      -- 'mux' => Always forward action to multiplexer
      float_win_behavior = 'previous',
      -- when moving cursor between splits left or right,
      -- place the cursor on the same row of the *screen*
      -- regardless of line numbers. False by default.
      -- Can be overridden via function parameter, see Usage.
      move_cursor_same_row = false,
      -- whether the cursor should follow the buffer when swapping
      -- buffers by default; it can also be controlled by passing
      -- `{ move_cursor = true }` or `{ move_cursor = false }`
      -- when calling the Lua function.
      cursor_follows_swapped_bufs = false,
      -- resize mode options
      resize_mode = {
        -- key to exit persistent resize mode
        quit_key = '<ESC>',
        -- keys to use for moving in resize mode
        -- in order of left, down, up' right
        resize_keys = { 'h', 'j', 'k', 'l' },
        -- set to true to silence the notifications
        -- when entering/exiting persistent resize mode
        silent = false,
        -- must be functions, they will be executed when
        -- entering or exiting the resize mode
        hooks = {
          on_enter = nil,
          -- on_leave = require('bufresize').register,
        },
      },
      -- ignore these autocmd events (via :h eventignore) while processing
      -- smart-splits.nvim computations, which involve visiting different
      -- buffers and windows. These events will be ignored during processing,
      -- and un-ignored on completed. This only applies to resize events,
      -- not cursor movement events.
      ignored_events = {
        'BufEnter',
        'WinEnter',
      },
      -- enable or disable a multiplexer integration;
      -- automatically determined, unless explicitly disabled or set,
      -- by checking the $TERM_PROGRAM environment variable,
      -- and the $KITTY_LISTEN_ON environment variable for Kitty.
      -- You can also set this value by setting `vim.g.smart_splits_multiplexer_integration`
      -- before the plugin is loaded (e.g. for lazy environments).
      multiplexer_integration = nil,
      -- disable multiplexer navigation if current multiplexer pane is zoomed
      -- this functionality is only supported on tmux and Wezterm due to kitty
      -- not having a way to check if a pane is zoomed
      disable_multiplexer_nav_when_zoomed = true,
      -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
      log_level = 'info',
    },
    init = function(opts)
      -- moving between splits
      vim.keymap.set({ 'n', 't' }, '<A-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set({ 'n', 't' }, '<A-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set({ 'n', 't' }, '<A-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set({ 'n', 't' }, '<A-l>', require('smart-splits').move_cursor_right)
      vim.keymap.set({ 'n', 't' }, '<A-\\>', require('smart-splits').move_cursor_previous)
      -- Resizing splits
      vim.keymap.set({ 'n', 't' }, '<A-C-h>', require('smart-splits').resize_left)
      vim.keymap.set({ 'n', 't' }, '<A-C-j>', require('smart-splits').resize_down)
      vim.keymap.set({ 'n', 't' }, '<A-C-k>', require('smart-splits').resize_up)
      vim.keymap.set({ 'n', 't' }, '<A-C-l>', require('smart-splits').resize_right)
      -- swapping buffers between windows
      vim.keymap.set({ 'n', 't' }, '<leader><leader>h', require('smart-splits').swap_buf_left)
      vim.keymap.set({ 'n', 't' }, '<leader><leader>j', require('smart-splits').swap_buf_down)
      vim.keymap.set({ 'n', 't' }, '<leader><leader>k', require('smart-splits').swap_buf_up)
      vim.keymap.set({ 'n', 't' }, '<leader><leader>l', require('smart-splits').swap_buf_right)
    end,
  },
}
