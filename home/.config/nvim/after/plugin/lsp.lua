require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = false
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
    vim.keymap.set("n", "<leader>sws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>sd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>sca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>srr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>srn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>sF", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-g>", function() vim.lsp.buf.signature_help() end, opts)
  end
})

local xdg_config_home = os.getenv("XDG_CONFIG_HOME")
if xdg_config_home ~= nil then
   xdg_config_home = os.getenv("HOME").."/.config"
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_capabilities = cmp_nvim_lsp.default_capabilities()
local nvim_lsp = require('lspconfig')
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
nvim_lsp.clangd.setup{ capabilities = lsp_capabilities, handlers = handlers, cmd = {"/usr/bin/clangd", "--background-index", "--header-insertion=never"}}
nvim_lsp.tsserver.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.cssls.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.emmet_ls.setup{ capabilities = lsp_capabilities, handlers = handlers}

nvim_lsp.lua_ls.setup{
  capabilities = lsp_capabilities,
  handlers = handlers,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
          Lua = {
            runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

nvim_lsp.rust_analyzer.setup{
  capabilities = lsp_capabilities,
  handlers = handlers,
  cmd = {"/usr/bin/rust-analyzer"},
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
      diagnostic = {
        enable = true
      }
    }
  }
}

nvim_lsp.tsserver.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.pylsp.setup{ capabilities = lsp_capabilities, handlers = handlers,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W504', 'W501'},
          maxLineLength = 100
        }
      }
    }
  }
}
nvim_lsp.arduino_language_server.setup{
  capabilities = lsp_capabilities,
  handlers = handlers,
  cmd = {"/usr/bin/arduino-language-server",
         "-clangd", '/usr/bin/clangd',
         "-fqbn", "esp32:esp32:nodemcu-32s",
         "-cli", '/usr/bin/arduino-cli', "-cli-config",
         xdg_config_home..'/arduino15/arduino-cli.yaml'}
}
nvim_lsp.svelte.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.texlab.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.dotls.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.cmake.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.vimls.setup{ capabilities = lsp_capabilities, handlers = handlers}
nvim_lsp.bashls.setup{ capabilities = lsp_capabilities, handlers = handlers}
