require("sbdaule")

function Reload()
  require("sbdaule").reload()
end

vim.cmd([[
"set guifont=DroidSansMono\ Nerd\ Font\ 11

" Setting cursor style based on mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
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

" Telescope
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fl <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Buffers<cr>
" nnoremap <leader>ft <cmd>Tags<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fg <cmd>Telescope git_files<cr>

" Gundo.vim

let g:gundo_width = 50
let g:gundo_preview_height = 20
let g:gundo_prefer_python3 = 1

call plug#begin()
Plug 'Shougo/context_filetype.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'
Plug 'leafgarland/typescript-vim'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'svermeulen/vim-subversive'
Plug 'sudar/vim-arduino-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim-scripts/DrawIt'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'vimwiki/vimwiki'
Plug 'lilydjwg/colorizer'
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
Plug 'tanvirtin/monokai.nvim'
Plug 'junegunn/fzf.vim', { 'do' : { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'kana/vim-operator-user' 

" LSP Support
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional
Plug 'neovim/nvim-lspconfig'                           " Required

" Autocompletion
" Plug 'hrsh7th/nvim-cmp'     " Required
" Plug 'hrsh7th/cmp-nvim-lsp' " Required
" Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'cpiger/NeoDebug'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

let g:lsc_auto_map = v:true
]])
