if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

filetype off

"-----------------------------------------------------------------------------

" plugins setup
"------------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

"themes
Plug 'google/vim-colorscheme-primary'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Lokaltog/vim-distinguished'
Plug 'nanotech/jellybeans.vim'

"syntax
Plug 'JulesWang/css.vim'
Plug 'pangloss/vim-javascript'
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-ruby/vim-ruby'
Plug 'wavded/vim-stylus'

"all
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'justinmk/vim-dirvish'

Plug 'moll/vim-bbye'
Plug 'wincent/ferret'

Plug 'wincent/loupe'
Plug 'wincent/terminus'

Plug 'wincent/command-t', {
      \   'do': 'cd ruby/command-t && ruby extconf.rb && make'
      \ }
call plug#end()

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete

" let g:airline_powerline_fonts = 1

"ferret

"find in folder/files the world under the cursor
nmap <leader>fw <Plug>(FerretAckWord)
"find in folder/files
nmap <leader>ff <Plug>(FerretAck)
" find and replace
nmap <leader>fr <Plug>(FerretAcks)

"lope
nmap <leader>h <Plug>(LoupeClearHighlight)

"command-t
let g:CommandTFileScanner = 'git'

"terminus
let g:TerminusInsertCursorShape = 0
let g:TerminusNormalCursorShape = 0
let g:TerminusReplaceCursorShape = 0
let g:TerminusMouse = 0

"------------------------------------------------------------------------------

" user setting
"------------------------------------------------------------------------------

syntax enable
filetype plugin indent on

" allow unrestricted backspacing in insert mod
set backspace=indent,eol,start
set complete=.,w,b,t

" omnifuncs
set ofu=syntaxcomplete#Complete
augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType stylus,css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,xhtml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

" allow switching from changed buffers
set hidden

" remember more
set history=1000

set mouse=a

" make searching easier
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch

"no autobackups at all
set nobackup
set noswapfile
set nowrap
set nowritebackup

set pastetoggle=<f12>

set shell=/bin/bash

set smarttab

set splitbelow
set splitright

set laststatus=2
set showtabline=1 "when tabs are being used
set guioptions-=e

if has('wildmenu')
  set wildmode=longest:full,full
  set wildmenu
endif

if has('wildignore')
  set wildignore+=.git,.svn
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
  set wildignore+=*.mp3,*.mpeg4,*.mp4,*.mov,*.flv,*.mkv,*.mov
  set wildignore+=*.eot,*.ttf,*.woff,*.woff2,*.svg,*.ico
  set wildignore+=*.sw?
  set wildignore+=*.nupkg,*.dll,*.exe
  set wildignore+=.DS_Store
  set wildignore+=node_modules,bower_components
  let g:netrw_list_hide='.*\.git,.*\.DS_Store,.\/node_modules$'
endif

if &compatible
  set nocompatible
endif

" theme
"------------------------------------------------------------------------------

" silent! colorscheme peachpuff
silent! colorscheme PaperColor
set background=light

highlight CursorLineNr cterm=bold ctermfg=white guifg=white
" highlight CursorLine cterm=NONE ctermbg=darkgray guibg=darkgray guifg=NONE ctermfg=NONE
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set title

set listchars=tab:▸\ ,eol:•,trail:—
set number
set relativenumber

if has('linebreak')
  let &showbreak='⤷  '
endif
"------------------------------------------------------------------------------

" maps
"------------------------------------------------------------------------------

noremap <F5> :so ~/.vimrc<cr>

noremap E g_
noremap B ^

noremap <leader>w :w<cr>
noremap <leader>d :Bdelete<cr>
noremap <leader>cd :lcd %:p:h<cr>
noremap <leader>r :%s:::gc<left><left><left><left>
noremap <leader>/ /\V
noremap <leader>cq :cclose<cr>

"nav jumplist
nnoremap ]j g,
nnoremap [j g;

"change to insert mode and create a linebreak on carret's position
noremap <C-o> i<cr>

"graphical moving when in normal mode
nnoremap j gj
nnoremap k gk
nnoremap Y y$

vnoremap // y/<C-R>"<CR>

nnoremap <silent> coq :call helper#QuickFix_toggle()<cr>
"------------------------------------------------------------------------------

" auto settings
"------------------------------------------------------------------------------

"defaults editor setting. better using editorconfig instead!
autocmd FileType {javascript,html,svg,css,stylus,scss,htmldjango} set tabstop=2 sts=2 sw=2 noexpandtab
autocmd FileType {python} set tabstop=8 sts=4 sw=4 expandtab
autocmd FileType {ruby,sh,vim,yaml} set tabstop=2 sts=2 sw=2 expandtab

" specific theme for diff buffers
" autocmd BufNewFile,BufRead * if &diff | colorscheme distinguished | endif

" linking formats with filtypes
autocmd BufNewFile,BufRead *.{bash} set filetype=sh syntax=sh
autocmd BufNewFile,BufRead *.{cshtml} set filetype=html syntax=html bomb
autocmd BufNewFile,BufRead *.{njk} set filetype=html syntax=htmldjango
autocmd BufNewFile,BufRead *.{styl,stylus} set filetype=stylus syntax=stylus
autocmd BufNewFile,BufRead *.{tag,ejs} set filetype=html syntax=html

autocmd BufWritePre {javacript,html,python,ruby,sh,vim} call helper#StripTrailingWhitespace()
