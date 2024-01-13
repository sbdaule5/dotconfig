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

" Abbrivations
let g:abbreviation_marker = "Abbreviations"
function! LoadAbb()
  let markerline = search(g:abbreviation_marker, 'nw')
  let lastline = line('$')
  let p = markerline + 2
  if markerline != 0
    " Clear existing Abbrivations
    abclear <buffer>
    " Load Abbrivations
    while p <= lastline
      let curr_line = getline(p)
      if curr_line =~ "^[^ ][^ ]* [^ ][^ ]*$"
        execute 'Abolish -buffer '..curr_line
      endif
      let p = p + 1
    endwhile
  endif
endfunction

augroup AutoAdjustEquals
  autocmd!
  autocmd BufWritePre *.md call AdjustEquals()
augroup END

function! AdjustEquals()
  let l:line = 1
  let l:lastline = line('$')
  let l:dash_found = 0
  while l:line <= l:lastline
    let l:current_line = getline(l:line)
    let l:prev_line = getline(l:line - 1)

    if l:current_line =~# '^=\+$' && l:prev_line =~# '^.\+$'
      let l:equals = repeat('=', len(l:prev_line))
      call setline(l:line, l:equals)
    elseif l:current_line =~# '^--\+$' && l:prev_line =~# '^[^-].\+$'
      let l:dash_found = l:dash_found + 1

      if l:dash_found > 1
        let l:equals = repeat('-', len(l:prev_line))
        call setline(l:line, l:equals)
      endif

    endif

    let l:line = l:line + 1
  endwhile
endfunction

" au FileType vimwiki.md set ft=markdown
augroup AbbrivationsGroup
  autocmd!
  autocmd BufRead *.md call LoadAbb()
  autocmd BufWrite *.md call LoadAbb()
augroup END

nnoremap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>

let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0
let g:instant_username="sbdaule"

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
let g:vimtex_compiler_latexmk = {
      \ 'aux_dir': "./aux",
      \ 'out_dir': "./out",
      \}

" Undo tree
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 40
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1

" Flutter
" let g:flutter_command = "/home/sbdaule/projects/smart-insti-app/SDK/flutter/bin/flutter"

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
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'lilydjwg/colorizer'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'

" Ricing
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvimdev/dashboard-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" LSP Support
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'

" Fuzzy completions
Plug 'tzachar/fuzzy.nvim'
Plug 'tzachar/cmp-fuzzy-buffer'
Plug 'romgrk/fzy-lua-native'

Plug 'vijaymarupudi/nvim-fzf'

Plug 'lervag/vimtex'
Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'jbyuki/instant.nvim'
Plug 'thosakwe/vim-flutter'
Plug 'mipmip/vim-scimark'

call plug#end()

let g:lsc_auto_map = v:true