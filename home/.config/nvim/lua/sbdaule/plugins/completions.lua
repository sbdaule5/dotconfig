return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),

        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,

        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },

      -- Adds other completion capabilities.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      -- 'hrsh7th/cmp-nvim-lua',
      'micangl/cmp-vimtex',
      'lukas-reineke/cmp-rg',
      'saadparwaiz1/cmp_luasnip',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mappings = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-n>'] = cmp.select_next_item(),
          ['<C-p>'] = cmp.select_prev_item(),

          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<CR>'] = cmp.mapping.confirm { select = false },

          ['<C-Space>'] = cmp.mapping.complete {},

          ['<C-L>'] = cmp.mapping(function()
            cmp.complete_common_string()
          end, { 'i' }),

          ['<C-j>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-k>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'fuzzy_buffer' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vim-dadbod-completion' },
          -- { name = 'nvim_lua' },
          { name = 'vimtex' },
        },
      }

      vim.keymap.set('i', '<C-n>', "<Cmd>lua require('cmp').select_next_item()<CR>", { silent = true })
      vim.keymap.set('i', '<C-p>', "<Cmd>lua require('cmp').select_prev_item()<CR>", { silent = true })
      vim.keymap.set('i', '<C-y>', "<Cmd>lua require('cmp').confirm()<CR>", { silent = true })
      vim.keymap.set('i', '<C-L>', "<Cmd>lua require('cmp').complete_common_string()<CR>", { silent = true })
      vim.keymap.set('i', '<C-Space>', "<Cmd>lua require('cmp').complete()<CR>", { silent = true })
      vim.keymap.set('i', '<C-j>', "<Cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
      vim.keymap.set('i', '<C-k>', "<Cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })
      vim.keymap.set('i', '<C-h>', "<Cmd>lua require('luasnip').change_choice()<CR>", { silent = true })
      vim.keymap.set('i', '<C-l>', "<Cmd>lua require('luasnip').change_choice(1)<CR>", { silent = true })
    end,
  },
}
