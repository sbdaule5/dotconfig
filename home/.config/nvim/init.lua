require("sbdaule")

function Reload() vim.cmd [[luafile ~/.config/nvim/init.lua]]
  vim.cmd [[luafile ~/.config/nvim/lua/sbdaule/init.lua]]
  require("sbdaule").reload()
end

vim.cmd([[
"set guifont=DroidSansMono\ Nerd\ Font\ 11
set path+=**

" Setting cursor style based on mode
" let &t_SI = "\e[5 q"
" let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

au BufRead,BufNewFile *.h set filetype=c
" au FileType c,cpp setlocal foldmethod=marker
" au FileType c,cpp setlocal foldmarker={,}

" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
set list listchars=tab:\\x20\\x20,trail:-

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

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

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    exec ':bd ' . old_name
    redraw!
  endif
endfunction
command! Rename call RenameFile()

nnoremap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>

let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0

augroup VimwikiKeybinding
  autocmd!
  autocmd FileType vimwiki lua vimwikiKeybindings()
augroup END

" NerdCommenter
" NERDCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:ft = ''

" settings for vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'

" Undo tree
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 40
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1

let g:gundo_width = 50
let g:gundo_preview_height = 20
let g:gundo_prefer_python3 = 1

call plug#begin()
" Essential plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
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
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional
Plug 'neovim/nvim-lspconfig'                           " Required

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'

Plug 'tzachar/fuzzy.nvim'
Plug 'tzachar/cmp-fuzzy-buffer'
Plug 'romgrk/fzy-lua-native'

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
"Plug 'lervag/vimtex'
"Plug 'sjl/gundo.vim'
"Plug 'tanvirtin/monokai.nvim'
"Plug 'kana/vim-operator-user'


call plug#end()

let g:lsc_auto_map = v:true
]])
