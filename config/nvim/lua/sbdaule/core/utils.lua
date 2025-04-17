---Reloads a Lua module.
---@param module_name string The name of the module to reload.
---@return any The reloaded module.
function RELOAD(module_name)
  package.loaded[module_name] = nil
  vim.notify("Module " .. module_name .. " reloaded")
  return require(module_name)
end

R = RELOAD
