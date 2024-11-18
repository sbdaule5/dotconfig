return {
  'gpg',
  name = 'gpg',
  dir = '~/projects/011.nvim-plugins/gpg.nvim/',
  dev = { true },
  opts = {},
  config = function()
    require('gpg').setup()
  end,
}
