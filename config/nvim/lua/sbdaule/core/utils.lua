---Reloads a Lua module.
---@param module_name string The name of the module to reload.
---@return any The reloaded module.
function RELOAD(module_name)
  package.loaded[module_name] = nil
  vim.notify('Module ' .. module_name .. ' reloaded')
  return require(module_name)
end

R = RELOAD

function PRINT_TABLE(table)
  print(vim.inspect(table))
end

P = PRINT_TABLE

vim.api.nvim_create_user_command("P", P, {})
