function addCalloutSnips(callouts)
  -- add snippets for Obsidian callouts
  local ls = require 'luasnip'
  -- some shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local l = require('luasnip.extras').lambda
  local rep = require('luasnip.extras').rep
  local p = require('luasnip.extras').partial
  local m = require('luasnip.extras').match
  local n = require('luasnip.extras').nonempty
  local dl = require('luasnip.extras').dynamic_lambda
  local fmt = require('luasnip.extras.fmt').fmt
  local fmta = require('luasnip.extras.fmt').fmta
  local types = require 'luasnip.util.types'
  local conds = require 'luasnip.extras.conditions'
  local conds_expand = require 'luasnip.extras.conditions.expand'

  -- individual snippets
  for k, v in pairs(callouts) do
    if not v.nosnippet then
      ls.add_snippets('markdown', {
        s(k, {
          t { '> ' .. v.raw .. ' ' },
          i(1),
          t { '', '> ' },
          i(2),
        }),
        s(k, {
          t { '> ' .. v.raw .. ' ' },
          i(1),
        }),
      })
    end
  end

  local raws = {}
  for _, v in pairs(callouts) do
    table.insert(raws, t(v.raw))
  end

  -- unified snippet
  ls.add_snippets('markdown', {
    s('callouts', {
      t { '> ' },
      c(1, raws),
      t { ' ' },
      i(2),
      t { '', '> ' },
      i(3),
    }),
  })
end

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons', 'L3MON4D3/LuaSnip' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { 'markdown' },
      heading = {
        enabled = true,
        sign = true,
        position = 'overlay',
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        signs = { '󰫎 ' },
        width = 'full',

        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,

        -- Determines if a border is added above and below headings
        border = true,
        border_virtual = false,
        border_prefix = false,
        above = '▄',
        below = '▀',

        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
        -- The 'level' is used to index into the list using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
          'RenderMarkdownH1',
          'RenderMarkdownH2',
          'RenderMarkdownH3',
          'RenderMarkdownH4',
          'RenderMarkdownH5',
          'RenderMarkdownH6',
        },
      },
      code = {
        enabled = true,
        sign = true,
        -- Determines how code blocks & inline code are rendered:
        --  none:     disables all rendering
        --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full:     normal + language
        style = 'full',
        -- Determines where language icon is rendered:
        --  right: right side of code block
        --  left:  left side of code block
        position = 'right',
        -- Amount of padding to add around the language
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        language_pad = 1,
        -- Whether to include the language name next to the icon
        language_name = true,
        -- A list of language names for which background highlighting will be disabled
        -- Likely because that language has background highlights itself
        disable_background = { 'diff' },
        -- Width of the code block background:
        --  block: width of the code block
        --  full:  full width of the window
        width = 'block',
        -- Amount of margin to add to the left of code blocks
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        -- Margin available space is computed after accounting for padding
        left_margin = 0,
        -- Amount of padding to add to the left of code blocks
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        left_pad = 1,
        -- Amount of padding to add to the right of code blocks when width is 'block'
        -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        right_pad = 2,
        -- Minimum width to use for code blocks when width is 'block'
        min_width = 40,
        -- Determines how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin:  when lines are empty overlay the above & below icons
        border = 'thin',
        -- Used above code blocks for thin border
        above = '▄',
        -- Used below code blocks for thin border
        below = '▀',
        -- Highlight for code blocks
        highlight = 'RenderMarkdownCode',
        -- Highlight for inline code
        highlight_inline = 'RenderMarkdownCodeInline',
        -- Highlight for language, overrides icon provider value
        highlight_language = nil,
      },
      checkbox = {
        enabled = true,
        -- Determines how icons fill the available space:
        --  inline:  underlying text is concealed resulting in a left aligned icon
        --  overlay: result is left padded with spaces to hide any additional text
        position = 'inline',
        unchecked = {
          -- Replaces '[ ]' of 'task_list_marker_unchecked'
          icon = '󰄱 ',
          -- Highlight for the unchecked icon
          highlight = 'RenderMarkdownUnchecked',
          -- Highlight for item associated with unchecked checkbox
          scope_highlight = nil,
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = '󰱒 ',
          -- Highlight for the checked icon
          highlight = 'RenderMarkdownChecked',
          -- Highlight for item associated with checked checkbox
          scope_highlight = nil,
        },
        -- Define custom checkbox states, more involved as they are not part of the markdown grammar
        -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
        -- Can specify as many additional states as you like following the 'todo' pattern below
        --   The key in this case 'todo' is for healthcheck and to allow users to change its values
        --   'raw':             Matched against the raw text of a 'shortcut_link'
        --   'rendered':        Replaces the 'raw' value when rendering
        --   'highlight':       Highlight for the 'rendered' icon
        --   'scope_highlight': Highlight for item associated with custom checkbox
        custom = {
          todo = {
            raw = '[-]',
            rendered = '󰥔 ',
            highlight = 'RenderMarkdownTodo',
            scope_highlight = nil,
          },
          partially_complete1 = {
            raw = '[.]',
            rendered = '󱗝 ',
            highlight = 'RenderMarkdownUnchecked',
            scope_highlight = nil,
          },
          partially_complete2 = {
            raw = '[o]',
            rendered = '󱗝 ',
            highlight = 'RenderMarkdownUnchecked',
            scope_highlight = nil,
          },
          cancelled = {
            raw = '[_]',
            rendered = '󰛲 ',
            highlight = 'RenderMarkdownInfo',
            scope_highlight = nil,
          },
        },
      },
      pipe_table = {
        -- Turn on / off pipe table rendering
        enabled = true,
        -- Pre configured settings largely for setting table border easier
        --  heavy:  use thicker border characters
        --  double: use double line border characters
        --  round:  use round border corners
        --  none:   does nothing
        preset = 'round',
        -- Determines how the table as a whole is rendered:
        --  none:   disables all rendering
        --  normal: applies the 'cell' style rendering to each row of the table
        --  full:   normal + a top & bottom line that fill out the table when lengths match
        style = 'full',
        -- Determines how individual cells of a table are rendered:
        --  overlay: writes completely over the table, removing conceal behavior and highlights
        --  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
        --  padded:  raw + cells are padded to maximum visual width for each column
        --  trimmed: padded except empty space is subtracted from visual width calculation
        cell = 'trimmed',
        -- Amount of space to put between cell contents and border
        padding = 1,
        -- Minimum column width to use for padded or trimmed cell
        min_width = 0,
        -- Characters used to replace table border
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
        -- stylua: ignore
        -- border = {
        --     '┌', '┬', '┐',
        --     '├', '┼', '┤',
        --     '└', '┴', '┘',
        --     '│', '─',
        -- },
        -- Gets placed in delimiter row for each column, position is based on alignment
        alignment_indicator = '━',
        -- Highlight for table heading, delimiter, and the line above
        head = 'RenderMarkdownTableHead',
        -- Highlight for everything else, main table rows and the line below
        row = 'RenderMarkdownTableRow',
        -- Highlight for inline padding used to add back concealed space
        filler = 'RenderMarkdownTableFill',
      },
      callout = {
        note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo', nosnippet = true },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess', nosnippet = true },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint', nosnippet = true },
        warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn', nosnippet = true },
        caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError', nosnippet = true },
        -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
        abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
        summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
        tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
        info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
        todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
        hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
        success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
        check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
        done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
        question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
        help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
        faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
        attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
        failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
        fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
        missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
        danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
        error = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError' },
        bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
        example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
        quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
        cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
        -- My custom callouts
        defination = { raw = '[!DEFINATION]', rendered = '󰨸 Defination', highlight = 'RenderMarkdownInfo' },
      },
      link = {
        -- TODO: Expand this section as needed
        enabled = true,
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
        custom = {
          github = { pattern = '^http[s]?://github.com/.*', icon = ' ', highlight = 'RenderMarkdownLink' },
          reddit = { pattern = '^http[s]?://reddit.com/.*', icon = '󰑍 ', highlight = 'RenderMarkdownLink' },
          youtube = { pattern = '^http[s]?://www.youtube.com/.*', icon = ' ', highlight = 'RenderMarkdownLink' },
          cppreference = { pattern = '^http[s]?://en.cppreference.com/.*', icon = ' ', highlight = 'RenderMarkdownLink' },
          web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
        },
      },
      indent = {
        -- Turn on / off org-indent-mode
        enabled = true,
        -- Amount of additional padding added for each heading level
        per_level = 2,
        -- Heading levels <= this value will not be indented
        -- Use 0 to begin indenting from the very first level
        skip_level = 1,
        -- Do not indent heading titles, only the body
        skip_heading = true,
      },
    },
    init = function()
      vim.g.vim_markdown_fenced_languages = { 'c', 'python', 'py=python', 'cpp', 'c++=cpp', 'sql' }
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_auto_insert_bullets = 1
      vim.g.vim_markdown_new_list_item_indent = 4
      vim.g.vim_markdown_no_extensions_in_markdown = 1
      vim.g.vim_markdown_borderless_table = 1
      vim.g.vim_markdown_override_foldtext = 1
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_follow_anchor = 1
    end,
    config = function(_, opts)
      require('render-markdown').setup(opts)
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('local-markdown-render', { clear = true }),
        pattern = { '*.md' },
        callback = function()
          require('render-markdown').enable()
        end,
      })
      addCalloutSnips(opts.callout)
    end,
  },
  {
    'praczet/yaml-tags.nvim',
    opts = {
      sanitizer = true,
      tag_formatting = {
        allow_camel_case = false,
        allowed_characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
      },
      forbidden_words = { 'and', 'is', 'or', 'a', 'the', 'not' },
      excluded_directories = {},
      included_directories = { vim.fs.joinpath(os.getenv 'HOME', 'notes') },
    },
    dependencies = {
      'nvim-telescope/telescope.nvim', -- for file and tag search
      '3rd/image.nvim',
    },
  },
  {
    'Thiago4532/mdmath.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- Filetypes that the plugin will be enabled by default.
      filetypes = { 'markdown' },

      -- Color of the equation, can be a highlight group or a hex color.
      -- Examples: 'Normal', '#ff0000'
      foreground = 'Normal',
      -- Hide the text when the equation is under the cursor.
      anticonceal = true,
      -- Hide the text when in the Insert Mode.
      hide_on_insert = true,
      -- Enable dynamic size for non-inline equations.
      dynamic = true,
      -- Configure the scale of dynamic-rendered equations.
      dynamic_scale = 1.0,

      -- Internal scale of the equation images, increase to prevent blurry images when increasing terminal
      -- font, high values may produce aliased images.
      -- WARNING: This do not affect how the images are displayed, only how many pixels are used to render them.
      --          See `dynamic_scale` to modify the displayed size.
      internal_scale = 1.0,
    },

    build = ':MdMath build'
  },
}
