-- local molten = require("molten")
-- molten.setup()
vim.g.molten_output_win_max_height = 20
vim.g.molten_image_provider = 'image.nvim'

vim.g.molten_virt_lines_off_by_1 = true

local quarto = require 'quarto'
quarto.setup {
  lspFeatures = {
    -- NOTE: put whatever languages you want here:
    languages = { 'python' },
    chunks = 'all',
    diagnostics = {
      enabled = true,
      triggers = { 'BufWritePost' },
    },
    completion = {
      enabled = true,
    },
  },
  keymap = {
    -- NOTE: setup your own keymaps:
    hover = 'K',
    definition = 'gd',
    rename = '<leader>sr',
    references = '<leader>sR',
    format = '<leader>sf',
  },
  codeRunner = {
    enabled = true,
    default_method = 'molten',
  },
}

local otter = require 'otter'
otter.setup {
  lsp = {
    -- `:h events` that cause the diagnostics to update. Set to:
    -- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
    -- but more instant diagnostic updates
    diagnostic_update_events = { 'BufWritePost' },
    -- function to find the root dir where the otter-ls is started
    root_dir = function(_, bufnr)
      return vim.fs.root(bufnr or 0, {
        '.git',
        '_quarto.yml',
        'package.json',
      }) or vim.fn.getcwd(0)
    end,
  },
  buffers = {
    -- if set to true, the filetype of the otterbuffers will be set.
    -- otherwise only the autocommand of lspconfig that attaches
    -- the language server will be executed without setting the filetype
    set_filetype = false,
    -- write <path>.otter.<embedded language extension> files
    -- to disk on save of main buffer.
    -- usefule for some linters that require actual files
    -- otter files are deleted on quit or main buffer close
    write_to_disk = false,
  },
  strip_wrapping_quote_characters = { "'", '"', '`' },
  -- otter may not work the way you expect when entire code blocks are indented (eg. in Org files)
  -- When true, otter handles these cases fully.
  handle_leading_whitespace = true,
}

require('jupytext').setup {
  style = 'markdown',
  output_extension = 'md',
  force_ft = 'markdown',
}
