require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-g>", function() vim.lsp.buf.signature_help() end, opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require('lspconfig')
nvim_lsp.clangd.setup{ capabilities = lsp_capabilities, handlers = handlers, cmd = {"/usr/bin/clangd", "--background-index", "--header-insertion=never"}}
nvim_lsp.tsserver.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.cssls.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.emmet_ls.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.luau_lsp.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.rust_analyzer.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.tsserver.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.jedi_language_server.setup{ capabilities = lsp_capabilities, handlers = handlers}
