function ChangeView(view)
    if (view == "UndoTree")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":UndotreeToggle"
    end
    if (view == "FileTree")
    then
        vim.cmd ":UndotreeHide"
        vim.cmd ":NvimTreeToggle"
    end
    if (view == "Buffers")
    then
        vim.cmd ":Buffers"
    end
    if (view == "Tags")
    then
        vim.cmd ":Tags"
    end
    if (view == "GitBlame")
    then
        vim.cmd ":Git blame"
    end
    if (view == "GitStatus")
    then
        vim.cmd ":Git"
    end
    if (view == "Quickfix")
    then
        vim.cmd ":copen"
    end
    if (view == "Dashboard")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":UndotreeHide"
        vim.cmd ":Dashboard"
    end
    if (view == "cp")
    then
        vim.cmd('split');
        vim.cmd('enew');
        vim.api.nvim_buf_set_name(0, '__INPUT__');
    end
end
