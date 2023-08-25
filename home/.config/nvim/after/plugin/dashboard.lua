myconfig = require("sbdaule")
db = require('dashboard')
db.setup({
  theme = 'doom',
  config = {
    header = {
      "",
      "",
      "",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
      "",
      "",
    },
    center = {
      {
        icon = ' ',
        desc = 'Dotfiles',
        desc_hl = 'String',
        key = 'd',
        key_hl = 'Number',
        action = 'lua dotfiles()'
      },
      {
        icon = '󰒋 ',
        desc = 'Mason',
        desc_hl = 'String',
        key = 'm',
        key_hl = 'Number',
        action = 'Mason'
      },
      {
        icon = '󰖬 ',
        desc = 'VimWiki',
        desc_hl = 'String',
        key = 'w',
        key_hl = 'Number',
        action = 'VimwikiIndex'
      },
      {
        icon = ' ',
        desc = "Today's diary",
        desc_hl = 'String',
        key = 't',
        key_hl = 'Number',
        action = 'VimwikiMakeDiaryNote'
      },
      {
        icon = ' ',
        desc = 'Reload NeoVim config',
        desc_hl = 'String',
        key = 'r',
        key_hl = 'Number',
        action = 'myconfig.reload()'
      },
      {
        icon = '󰿅  ',
        desc = 'Quit NeoVim',
        desc_hl = 'String',
        key = 'q',
        key_hl = 'Number',
        action = 'exit'
      },
    },
    footer = {
      "",
      "Shubham Daule's NeoVim",
      "",
      "   https://github.com/sbdaule5",
    }
  },
  hide = {
    statusline = false,
    tabline = false,
  },
})