require("lint").linters_by_ft = {
    python = { "pylint" },
    cmake = { "cmakelint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
        if not vim.opt.spell:get() then
            require("lint").try_lint("cspell")
        end
    end,
})
