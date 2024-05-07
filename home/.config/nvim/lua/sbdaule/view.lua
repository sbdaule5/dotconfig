CurrentLeftView = "Dashboard"

function ChangeView(view)
    if (view == "UndoTree")
    then
        vim.cmd ":NvimTreeClose"
        vim.cmd ":DBUI"
        vim.cmd ":DBUIToggle"
        vim.cmd ":UndotreeToggle"
        CurrentLeftView = view
    end
    if (view == "FileTree")
    then
        vim.cmd ":UndotreeHide"
        vim.cmd ":DBUI"
        vim.cmd ":DBUIToggle"
        vim.cmd ":NvimTreeToggle"
        CurrentLeftView = view
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
        vim.cmd ":enew"
        vim.cmd ":Dashboard"
        CurrentLeftView = view
    end
    if (view == "Overseer")
    then
        -- vim.cmd ":TagbarClose"
        vim.cmd ":OverseerToggle"
    end
    if (view == "Tagbar")
    then
        vim.cmd ":OverseerClose"
        -- vim.cmd ":TagbarToggle"
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
        CurrentLeftView = view
    end
end

function ViewFocusLeft()
    if(CurrentLeftView == "FileTree") then
        vim.cmd ":NvimTreeFocus"
    elseif (CurrentLeftView == "UndoTree") then
        vim.cmd ":UndotreeFocus"
    end
end
