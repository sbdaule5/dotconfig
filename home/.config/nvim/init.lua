local myconfig = require("sbdaule")

function Reload() vim.cmd [[luafile ~/.config/nvim/init.lua]]
  vim.cmd("luafile ~/.config/nvim/lua/sbdaule/init.lua")
  myconfig.reload()
end

vim.cmd([[
"set guifont=DroidSansMono\ Nerd\ Font\ 11
set path+=**

au BufRead,BufNewFile *.h set filetype=c
" au FileType c,cpp setlocal foldmethod=marker
" au FileType c,cpp setlocal foldmarker={,}

set list listchars=tab:\\x20\\x20,trail:-

" Indent text object
function! IndTxtObj(inner)
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") !~ "^\\s*$"
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      -
      let p = line(".") - 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      +
      let p = line(".") + 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! $
  endif
endfunction

nnoremap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>

let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0

augroup VimwikiKeybinding
  autocmd!
  autocmd FileType vimwiki lua vimwikiKeybindings()
augroup END

if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:ft = ''

" settings for vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_open_on_warning=0

" Undo tree
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 40
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1

" Start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

call plug#begin()
" Essential plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'svermeulen/vim-subversive'
Plug 'airblade/vim-gitgutter'

Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim', { 'do' : { -> fzf#install() } }
Plug 'mbbill/undotree'
Plug 'lilydjwg/colorizer'

Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" LSP Support
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'

Plug 'tzachar/fuzzy.nvim'
Plug 'tzachar/cmp-fuzzy-buffer'
Plug 'romgrk/fzy-lua-native'

Plug 'nvimdev/dashboard-nvim'
Plug 'vijaymarupudi/nvim-fzf'

Plug 'lervag/vimtex'
Plug 'untitled-ai/jupyter_ascending.vim'

Plug 'junegunn/vim-easy-align'

" Plug 'tversteeg/registers.nvim'
" Plug 'jupyter-vim/jupyter-vim'
" Autocompletion
" Plug 'L3MON4D3/LuaSnip'     " Required
"Plug 'cpiger/NeoDebug'
"Plug 'Shougo/context_filetype.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'evanleck/vim-svelte'
"Plug 'leafgarland/typescript-vim'
"Plug 'sudar/vim-arduino-syntax'
" Plug 'vim-scripts/DrawIt'
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'
"Plug 'kana/vim-operator-user'

call plug#end()

let g:lsc_auto_map = v:true
]])
