vim.opt.encoding = 'UTF-8'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.scrolloff = 5

vim.opt.fdm = 'expr'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 20
vim.opt.foldcolumn = "1"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.nrformats = 'alpha,hex,bin'
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.compatible = false
vim.cmd.syntax("on");
vim.cmd.filetype("plugin", "on");

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

vim.opt.grepprg = "ag"

-- Disable gitgutter default maps
vim.g.gitgutter_map_keys = 0

-- Notes
vim.g.vim_markdown_fenced_languages = { 'c', 'python', 'py=python', 'cpp', 'c++=cpp' }
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
-- vim.g.vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
