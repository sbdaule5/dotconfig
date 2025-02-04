local function nvim_tree_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "<C-H>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "<Space><Space>", api.tree.change_root_to_node, opts("Cd"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "zh", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
end

require("nvim-tree").setup({
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = nvim_tree_attach,
    hijack_unnamed_buffer_when_opening = true,
    hijack_netrw = true,
    disable_netrw = false,
})
