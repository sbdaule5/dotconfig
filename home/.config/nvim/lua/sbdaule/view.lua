function ChangeView(view)
    if (view == "UndoTree")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":DBUI"
        vim.cmd ":DBUIToggle"
        vim.cmd ":UndotreeToggle"
    end
    if (view == "FileTree")
    then
        vim.cmd ":UndotreeHide"
        vim.cmd ":DBUI"
        vim.cmd ":DBUIToggle"
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
        vim.cmd ":OverseerClose"
        vim.cmd ":DBUI"
        vim.cmd ":DBUIToggle"
        vim.cmd ":Dashboard"
    end
    if (view == "Overseer")
    then
        vim.cmd ":OverseerToggle"
    end
    if (view == "cp")
    then
        vim.cmd('split');
        vim.cmd('enew');
        vim.api.nvim_buf_set_name(0, '__INPUT__');
    end
    if (view == "db")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":UndotreeHide"
        vim.cmd ":DBUI"
    end
end
