scriptencoding utf-8

"===============================================================================
"Set Set Set Set
"===============================================================================

set autoindent                         " maintain indent of current line
set backspace=indent,eol,start         " allow unrestricted backspacing in insert mode
set complete=.,w,b,t
set cursorline
set encoding=utf-8
set fenc=utf-8
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set lazyredraw                        " don't bother updating screen during macro playback
set list
set listchars=tab:▸\ ,eol:•,trail:—
set nobackup
set noswapfile
set nowrap
set nowritebackup
set pastetoggle=<f12>
set relativenumber
set shell=/bin/bash
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start
set showmatch
set smartcase
set smarttab
set splitbelow
set splitright
set termencoding=utf-8
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                   " substitue for 'wildchar' (<Tab>) in macros
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

if has('wildmenu')
  set wildmenu
endif

if has('wildignore')
  set wildignore+=.DS_Store,*/node_modules/*,*/bower_components/*
endif

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif

if &compatible
  set nocompatible
endif

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

"-----------------------------------------------------------------------------
" plugins setup
"------------------------------------------------------------------------------

filetype off

call plug#begin('~/.vim/bundle')

"themes
Plug 'vim-scripts/summerfruit256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Lokaltog/vim-distinguished'
Plug 'nanotech/jellybeans.vim'

"syntax
Plug 'JulesWang/css.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'pangloss/vim-javascript'
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-ruby/vim-ruby'

"all
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'editorconfig/editorconfig-vim'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'justinmk/vim-dirvish'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t && ruby extconf.rb && make'
    \ }
call plug#end()

syntax on
filetype plugin indent on

"Ack
nnoremap <leader>f :Ack!<space>

if executable("rg")
    set grepprg="rg --vimgrep --no-heading"
    set grepformat="%f:%l:%c:%m,%f:%l:%m
    let g:ackprg="rg --vimgrep --no-heading --hidden"
elseif executable("ag")
    let g:ackprg="ag --vimgrep"
endif

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete

"undotree
nnoremap <F3> :UndotreeToggle<cr>

"command-t
let g:CommandTFileScanner = 'git'

"------------------------------------------------------------------------------
" theme
"------------------------------------------------------------------------------

silent! colorscheme gruvbox
set background=dark

if has('linebreak')
  let &showbreak='⤷  '
endif

"------------------------------------------------------------------------------
" maps
"------------------------------------------------------------------------------

noremap <F5> :so ~/.vimrc<cr>

nnoremap E g_
nnoremap B ^

"split horizontal
nnoremap <C-w><space> <C-w>s

noremap <leader>w :w<cr>
noremap <leader>d :Bdelete<cr>
noremap <leader>cd :lcd %:p:h<cr>
noremap /r :%s:::gc<left><left><left><left>
nnoremap // /\V

"remove empty lines
noremap <leader>re :call helper#RemoveEmptyLines()<cr>

"strip multiples empty lines into a single empty line
noremap <leader>se :call helper#SingleEmptyLines()<cr>

"change to insert mode and create a linebreak on carret's position
noremap <C-o> i<cr>

"duplicate current line
noremap <C-d> yyp

"graphical moving when in normal mode
nnoremap j gj
nnoremap k gk
