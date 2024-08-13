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

let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 1
let g:vimwiki_filetypes = ['md']

let g:wiki_root = '~/notes'

let g:instant_username="sbdaule"

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
let g:flutter_command = "HOME=/home/sbdaule/.local/share/no-xdg-home flutter"

" Start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

call plug#begin()
" Essential plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
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
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
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
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'theHamsta/nvim-treesitter-pairs'

" LSP Support
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'lukas-reineke/cmp-rg'
Plug 'L3MON4D3/LuaSnip'

" Fuzzy completions
Plug 'tzachar/fuzzy.nvim'
Plug 'tzachar/cmp-fuzzy-buffer'
Plug 'romgrk/fzy-lua-native'

Plug 'vijaymarupudi/nvim-fzf'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

Plug 'lervag/vimtex'
Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'jbyuki/instant.nvim'
Plug 'thosakwe/vim-flutter'
Plug 'mipmip/vim-scimark'
Plug 'diepm/vim-rest-console'
Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast' }
Plug 'lervag/wiki.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'stevearc/vim-arduino'
Plug 'vim-scripts/SingleCompile'
Plug 'stevearc/conform.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'normen/vim-pio'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'stevearc/overseer.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'David-Kunz/gen.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'folke/neodev.nvim'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'stevearc/dressing.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'kevinhwang91/nvim-bqf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ggandor/leap.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'SmiteshP/nvim-navic'
Plug 'Vigemus/iron.nvim'
Plug 'Zeioth/compiler.nvim'

" Plug 'preservim/tagbar'

" My plugins (dev or mod)
Plug '/home/sbdaule/projects/011.nvim-plugins/gpg.nvim'

call plug#end()

let g:lsc_auto_map = v:true
