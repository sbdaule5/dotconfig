local cmp = require'cmp'


cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mappings = {
      ['<C-n>'] = cmp.select_next_item(),
      ['<C-p>'] = cmp.select_prev_item(),
    },
    sources = cmp.config.sources(
      {

        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'fuzzy_buffer' },
      }
    )
  })

vim.keymap.set("i", "<C-n>", "<Cmd>lua require('cmp').select_next_item()<CR>", {silent = true})
vim.keymap.set("i", "<C-p>", "<Cmd>lua require('cmp').select_prev_item()<CR>", {silent = true})
vim.keymap.set("i", "<C-y>", "<Cmd>lua require('cmp').confirm()<CR>", {silent = true})
vim.keymap.set("i", "<C-l>", "<Cmd>lua require('cmp').complete_common_string()<CR>", {silent = true})
vim.keymap.set("i", "<C-Space>", "<Cmd>lua require('cmp').complete()<CR>", {silent = true})
vim.keymap.set("i", "<C-j>", "<Cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
vim.keymap.set("i", "<C-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})
