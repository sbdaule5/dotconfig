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
end
