return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>c', group = '[C]lipboard' },
      { '<leader>d', group = '[D]ebug' },
      { '<leader>f', group = '[F]ind', mode = { 'n', 'x' } },
      { '<leader>g', group = '[G]it', mode = { 'n' } },

      { '<leader>i', group = '[I]nfo' },
      { '<leader>m', group = '[M]arkdown' },

      { '<leader>s', group = 'L[S]P' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>u', group = '[U]tils' },
      { '<leader>v', group = '[V]iew' },
      { '<leader>w', group = '[W]indow' },
      { '<leader>x', group = 'e[X]ecute' },
    },
  },
}
