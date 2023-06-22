function ChangeView(view)
    if (view == "UndoTree")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":GundoToggle"
    end
    if (view == "FileTree")
    then
        vim.cmd ":GundoHide"
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
