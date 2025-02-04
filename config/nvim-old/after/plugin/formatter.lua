require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        haskell = { "fourmolu" },

        c = { { "clang-format", "ast-grep" } },
        cpp = { { "clang-format", "ast-grep" } },
        cmake = { "cmake_format" },
    },
})
