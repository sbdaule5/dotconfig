set encoding=UTF-8
"set guifont=DroidSansMono\ Nerd\ Font\ 11
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
syntax on

let mapleader = ","

noremap w <C-w>
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
nnoremap <Leader>i i <ESC>r
nnoremap <Leader><CR> i<CR><ESC>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>s :buffer #<CR>
" insert a blank line 
nnoremap ,o o<ESC>

" adding configurations for nerdtree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror 
" Ranger in vim
function RangerExplorer()
  exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
  if filereadable('/tmp/vim_ranger_current_file')
    exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
    call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

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
filetype plugin on
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
Plug('preservim/nerdtree')
Plug 'preservim/nerdcommenter'
Plug 'Shougo/context_filetype.vim'
Plug('pangloss/vim-javascript')
Plug('evanleck/vim-svelte')
Plug('leafgarland/typescript-vim')
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


call plug#end()
