-- This file contains keybindings and settings that I use specifically when
-- working with jupyter notebooks in percent format

-- function JupyterNewBlock(type, above)
--     -- Get values of original variables
--     local orig_ln = vim.api.nvim_get_current_line()
--     local r = vim.fn.getreg('/')
--     if not r then r = '' end

--     -- Move to the appropriate location
--     if not above then
--         vim.cmd "/^# %%"
--         vim.cmd "norm k"
--         local new_ln = vim.api.nvim_get_current_line()
--         if (new_ln < orig_ln) then
--             vim.cmd "norm G"
--         end
--     else
--         vim.cmd "?^# %%"
--         vim.cmd "norm k"
--         local new_ln = vim.api.nvim_get_current_line()
--         if (new_ln > orig_ln) then
--             vim.cmd "norm gg"
--         end
--     end

--     -- Add separators
--     vim.cmd ":norm o# %%"
--     if type == "markdown" then
--         vim.cmd ":norm a [markdown]"
--     end

--     -- Move to final position
--     vim.cmd "norm o"
--     vim.cmd "norm o"
--     vim.cmd "norm k"

--     -- Restore the original values
--     vim.cmd(":let @/='" .. r .. "'")
-- end

-- A simple version, use the above (with tweaking and fixing) if this dosen't work
function JupyterNewBlock(type, above)
    -- Move to the appropriate location
    if above then
        vim.cmd("norm k")
    end

    -- Add separators
    vim.cmd("norm o# %%")
    if type == "markdown" then
        vim.cmd("norm a [markdown]")
    end

    -- Move to final position
    vim.cmd("norm o# ")
    vim.cmd("norm $")
    vim.cmd("startinsert")
end
