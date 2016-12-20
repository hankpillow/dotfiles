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
set runtimepath+=~/.vim/bundle/Vundle.vim/
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
set textwidth=80
set title
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                   " substitue for 'wildchar' (<Tab>) in macros
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

if has('wildmenu')
  set wildmenu
endif

if has('wildignore')
  set wildignore+=.DS_Store,node_modules,bower_components
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
" netrws (side bar)
"------------------------------------------------------------------------------

let g:netrw_altfile=1           " last edited file '#'
let g:netrw_alto=0              " open files on right
let g:netrw_altv=1              " open files on right
let g:netrw_banner=0            " no banner
let g:netrw_browse_split=4
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_hide=1              " hide hidden files
let g:netrw_list_hide='\.git,.*\.DS_Store$'
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window
let g:netrw_winsize=20          " preview winsize

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
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
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

"------------------------------------------------------------------------------
" theme
"------------------------------------------------------------------------------

colorscheme gruvbox
set background=dark

if has('linebreak')
  let &showbreak='⤷  '
endif

"------------------------------------------------------------------------------
" maps
"------------------------------------------------------------------------------

noremap <F5> :so ~/.vimrc<cr>

nnoremap E $
nnoremap B ^

"save
noremap <leader>w :w<cr>

"like quit
noremap <leader>d :Bdelete<cr>

"change explorer to file's directory
noremap <leader>cd :lcd %:p:h<cr>

"every replace starts with 'magic' flag
noremap /r :%s:::gc<left><left><left><left>

"every search starts with 'magic' flag
nnoremap // /\V

"remove empty lines
noremap <leader>em :g/^\s*$/d<cr>

"remove multiples empty lines into a single one
noremap <leader>ml :%!cat -s<cr>

"change to insert mode and create a linebreak on carret's position
noremap <C-o> i<cr>

"duplicate current line
noremap <C-d> yyp

"graphical moving when in normal mode
nnoremap j gj
nnoremap k gk

