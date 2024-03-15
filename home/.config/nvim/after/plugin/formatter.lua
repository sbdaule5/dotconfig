require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },

        c = { { "clang-format", "ast-grep" } },
        cpp = { { "clang-format", "ast-grep" } },
    },
})
