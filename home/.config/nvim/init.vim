set encoding=UTF-8
"set guifont=DroidSansMono\ Nerd\ Font\ 11
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fdm=syntax
set number
set splitright
set splitbelow
set laststatus=3
set smartcase
syntax on
set nocompatible
filetype plugin on

" Setting cursor style based on mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

let mapleader = " "
nmap , <Space>

noremap e <C-E>
noremap y <C-Y>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" use alt+. and alt+, to change tabs
nnoremap < :tabprevious<CR> 
nnoremap > :tabnext<CR> 

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
command Rename call RenameFile()

" use leader key bindings
noremap <Leader>w <C-w>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>r :Rename<CR>
nnoremap <Leader>i i <ESC>r
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>s :buffer #<CR>
nnoremap <Leader>p :r! xsel -o -b<CR>
" insert a blank line 
nnoremap <Leader><CR> i<CR><ESC>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
" Run will change based on project and will be retained due to Session.vim
" x as in execute
nnoremap <Leader>x :Run<CR>
nnoremap <Leader>X :RunAlt<CR>
nnoremap <Leader>z :Build<CR>
" use leader / to stop highlighting
nnoremap <Leader>/ :noh<CR>

" enclose commands in visual mode using <Leader>e
vnoremap <Leader>e( c()<ESC>P
vnoremap <Leader>e) c()<ESC>P
vnoremap <Leader>e[ c[]<ESC>P
vnoremap <Leader>e] c[]<ESC>P
vnoremap <Leader>e{ c{}<ESC>P
vnoremap <Leader>e} c{}<ESC>P
vnoremap <Leader>e< c<><ESC>P
vnoremap <Leader>e> c<><ESC>P
vnoremap <Leader>e" c""<ESC>P
vnoremap <Leader>e' c''<ESC>P
vnoremap <Leader>e` c``<ESC>P
 
" adding configurations for nerdtree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror 
"
" Ranger in vim
function RangerExplorer()
  exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
  if filereadable('/tmp/vim_ranger_current_file')
    exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
    call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfun
" map <Leader>x :call RangerExplorer()<CR>


let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" emmet settings
let g:user_emmet_leader_key='<TAB>'
let g:user_emmet_settings = {
    \   'javascript.jsx' : {
        \'extends' : 'jsx',
    \ },
\ }

" NerdCommenter
" NERDCommenter settings
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"fu! NERDCommenter_before()
  "if (&ft == 'html') || (&ft == 'svelte')
    "let g:ft = &ft
    "let cfts = context_filetype#get_filetypes()
    "if len(cfts) > 0
      "if cfts[0] == 'svelte'
        "let cft = 'html'
      "elseif cfts[0] == 'scss'
        "let cft = 'css'
      "else
        "let cft = cfts[0]
      "endif
      "exe
      "'setf '
      ". cft
    "endif
  "endif
"endfu

"fu!
  "NERDCommenter_after()
  "if(g:ft == 'html') || (g:ft == 'svelte') 
    "exec 'setf' . g:ft
    "let g:ft = ''
  "endif
"endfu

if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
      \ [
      \   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
      \   {
      \     'filetype': 'typescript',
      \     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
      \     'end': '',
      \   },
      \   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
      \ ]

let g:ft = ''

call plug#begin()
Plug 'preservim/nerdtree' 
Plug 'preservim/nerdcommenter'
Plug 'Shougo/context_filetype.vim'
Plug 'pangloss/vim-javascript' 
Plug 'evanleck/vim-svelte' 
Plug 'leafgarland/typescript-vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'sudar/vim-arduino-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'triglav/vim-visual-increment'
Plug 'vim-scripts/DrawIt'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'vimwiki/vimwiki'
call plug#end()

let g:lsc_auto_map = v:true
