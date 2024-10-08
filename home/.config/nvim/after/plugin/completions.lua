local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mappings = {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.select_next_item(),
        ["<C-p>"] = cmp.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        {
            name = "lazydev",
            group_index = 0,
        },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "fuzzy_buffer" },
        { name = "nvim_lsp_signature_help" },
        { name = "vim-dadbod-completion" },
        { name = "nvim_lua" },
        { name = "vimtex" },
    }),
})

vim.keymap.set("i", "<C-n>", "<Cmd>lua require('cmp').select_next_item()<CR>", { silent = true })
vim.keymap.set("i", "<C-p>", "<Cmd>lua require('cmp').select_prev_item()<CR>", { silent = true })
vim.keymap.set("i", "<C-y>", "<Cmd>lua require('cmp').confirm()<CR>", { silent = true })
vim.keymap.set("i", "<C-L>", "<Cmd>lua require('cmp').complete_common_string()<CR>", { silent = true })
vim.keymap.set("i", "<C-Space>", "<Cmd>lua require('cmp').complete()<CR>", { silent = true })
vim.keymap.set("i", "<C-j>", "<Cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
vim.keymap.set("i", "<C-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })

require("lazydev").setup()
