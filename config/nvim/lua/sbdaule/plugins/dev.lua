return {
  {
    'gpg',
    name = 'gpg',
    dir = '~/projects/011.nvim-plugins/gpg.nvim/',
    dev = { true },
    opts = {},
    config = function()
      require('gpg').setup()
    end,
  },
  {
    'datapg',
    name = 'datapg',
    dir = '~/projects/011.nvim-plugins/datapg.nvim/',
    dev = { true },
    opts = {},
    config = function()
      require('datapg').setup()
    end,

  }
}
