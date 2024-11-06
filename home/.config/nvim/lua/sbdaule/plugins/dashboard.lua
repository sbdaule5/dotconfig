-- myconfig = require 'sbdaule'
myconfig = {
  reload = function ()
  end

}
return {
  'nvimdev/dashboard-nvim',
  opts = {
    theme = 'doom',
    config = {
      header = {
        '',
        '',
        '',
        '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
        '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
        '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
        '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
        '',
        '',
        '',
      },
      center = {
        {
          icon = ' ',
          desc = 'Files',
          desc_hl = 'String',
          key = 'f',
          key_hl = 'Number',
          action = 'NvimTreeOpen',
        },
        -- {
        --   icon = ' ',
        --   desc = 'Dotfiles',
        --   desc_hl = 'String',
        --   key = 'd',
        --   key_hl = 'Number',
        --   action = 'lua dotfiles()',
        -- },
        {
          icon = '󰒋 ',
          desc = 'Mason',
          desc_hl = 'String',
          key = 'm',
          key_hl = 'Number',
          action = 'Mason',
        },
        {
          icon = '󰖬 ',
          desc = 'VimWiki',
          desc_hl = 'String',
          key = 'w',
          key_hl = 'Number',
          action = 'WikiIndex',
        },
        {
          icon = ' ',
          desc = "Today's diary",
          desc_hl = 'String',
          key = 't',
          key_hl = 'Number',
          action = 'WikiJournal',
        },
        {
          icon = ' ',
          desc = 'Reload NeoVim config',
          desc_hl = 'String',
          key = 'r',
          key_hl = 'Number',
          action = 'myconfig.reload()',
        {
          icon = '󰒲 ',
          desc = 'Lazy',
          desc_hl = 'String',
          key = 'l',
          key_hl = 'Number',
          action = 'Lazy',
        },
        },
        {
          icon = '󰿅  ',
          desc = 'Quit NeoVim',
          desc_hl = 'String',
          key = 'q',
          key_hl = 'Number',
          action = 'exit',
        },
      },
      footer = {
        '',
        "Shubham Daule's NeoVim",
        '',
        '   https://github.com/sbdaule5',
      },
    },
    hide = {
      statusline = false,
      tabline = false,
    },
  },
}
