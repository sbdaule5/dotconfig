return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>sf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
    {
      '<leader>if',
      '<cmd>ConformInfo<cr>',
      mode = 'n',
      desc = '[I]nfo [F]romatter',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      scss = { { 'prettierd', 'prettier' } },
      svelte = { { 'prettierd', 'prettier' } },
      haskell = { 'fourmolu' },

      bash = { 'beautysh' },
      sh = { 'beautysh' },

      c = { 'clang-format' },
      cpp = { 'clang-format' },
      cuda = { 'clang-format' },
      cmake = { 'cmake_format' },
    },
    config = function(_, opts)
      vim.keymap.set('n', '<Leader>if', ':LspInfo<CR>')
      require('conform').setup(opts)
    end,
  },
}
