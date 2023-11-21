vim.opt.encoding = 'UTF-8'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.scrolloff = 5

vim.opt.fdm = 'expr'
vim.opt.foldexpr = "nvim_treesitter#flodexpr()"
vim.opt.foldenable = false

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
