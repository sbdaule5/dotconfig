require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },

  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-S-n>",
      node_decremental = "<C-p>",
    },
  },
  indent = {
    enabled = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
      filetypes = { "html", "xml" },
    }
  },
  textobjects = {
    select = {
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      enable = true,
      keymaps =
      {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["ia"] = "@attribute",
        ["aa"] = "@attribute.outer",

        ["ic"] = { query = "@comment.inner", desc = "Select inner part of a comment" },
        ["ac"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
        ["aS"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
}

require 'treesitter-context'.setup {
  enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 10,           -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 20,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'inner',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'topline',         -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20,     -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
