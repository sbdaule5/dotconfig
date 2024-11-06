return {
  'glepnir/template.nvim',
  enabled = false,
  cmd = { 'Template', 'TemProject' },
  opts = {
    temp_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'templates'),
    author = 'Shubham',
    email = 'sbdaule5@gmail.com',
  },
  config = function(_, opts)
    require('template').setup(opts)
  end,
}
