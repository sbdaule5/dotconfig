local projectfile = vim.fn.getcwd() .. '/project.godot'

if vim.loop.fs_stat(projectfile) ~= nil then
  vim.notify("Starting godot socket")
  vim.fn.serverstart './godothost'
end
