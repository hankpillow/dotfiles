if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

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
Plug 'vim-airline/vim-airline'

"syntax
Plug 'tpope/vim-git'
Plug 'JulesWang/css.vim'
Plug 'pangloss/vim-javascript'
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-ruby/vim-ruby'
Plug 'wavded/vim-stylus'

"utils and tools
Plug 'ternjs/tern_for_vim'
Plug 'majutsushi/tagbar' "https://github.com/majutsushi/tagbar
Plug 'editorconfig/editorconfig-vim' "https://github.com/editorconfig/editorconfig-vim
Plug 'justinmk/vim-dirvish'  "navigate on dir inside a buffer
Plug 'mattn/emmet-vim' "like html snipts  http://mattn.github.io/emmet-vim/
Plug 'mhinz/vim-grepper' "search tool using ag/rg/git etc https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt
Plug 'moll/vim-bbye' "manage closing buffers properly https://github.com/moll/vim-bbye

Plug 'tpope/vim-commentary' "https://github.com/tpope/vim-commentary
Plug 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround' "https://github.com/tpope/vim-surround
Plug 'tpope/vim-abolish' "https://github.com/tpope/tpope-vim-abolish
Plug 'tpope/vim-unimpaired' "https://github.com/tpope/vim-unimpaired

Plug 'kien/ctrlp.vim' "https://github.com/kien/ctrlp.vim

call plug#end()

"vim-bbye
noremap <leader>d :Bdelete<cr>

"tern
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete

"grepper
let g:grepper = {}
let g:grepper.jump = 0
let g:grepper.jump = 0
let g:grepper.open = 1
let g:grepper.tools = ['rg', 'git', 'ag', 'grep', 'ack']

nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

nnoremap <leader>ff :Grepper -highlight<cr>
nnoremap <leader>fb :Grepper -highlight -buffers<cr>
nnoremap <leader>fw :Grepper -cword -noprompt<cr>

" ctrlp
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.git|node_modules|bower_components)',
  \ }

" Using rg is fast, we don't need to cache.
let g:ctrlp_use_caching = 0

" The match should be at the top of the list.
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_extensions = ['tag', 'buffertag']

"helper functions
"------------------------------------------------------------------------------

function! HelperLastSearch()
  echo @/
endfunction

function! HelperRemoveEmptyLines()
  g/^\s*$/d
endfunction

function! HelperMatches()
  %s///n
endfunction

function! HelperHexOff()
  %!xxd -r
endfunction

function! HelperHexOn()
  %!xxd
endfunction

function! HelperSingleEmptyLines()
  %!cat -s
endfunction

function! HelperStripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

function! HelperQuickFixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endfunction

" user setting
"------------------------------------------------------------------------------

" set tags+=./tags

set gdefault "substitute global by default

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
set infercase "https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set smartcase
set incsearch
set showmatch

"no autobackups at all
set nobackup
set noswapfile
set nowritebackup

set nowrap
set pastetoggle=<f12>
set shell=/bin/bash
set smarttab

set splitbelow
set splitright

set laststatus=2
set showtabline=1 "when tabs are being used
set guioptions-=e

set wildmode=longest:full,full
set wildmenu

"images
set wildignore+=*.jpe?g,*.bmp,*.gif,*.png

"sounds
set wildignore+=*.mp3,*.mpeg4,*.mp4,*.mov,*.flv,*.mkv

"fonts
set wildignore+=*.eot,*.ttf,*.woff,*.woff2

"comp and gem files
set wildignore+=*.sw?,*.nupkg,*.dll,*.exe

"system trash
set wildignore+=.DS_Store,thumbs.db

"versioning
set wildignore+=.git/**,.svn/**

if &compatible
  set nocompatible
endif

" theme
"------------------------------------------------------------------------------

" silent! colorscheme peachpuff
silent! colorscheme PaperColor
set background=dark

set synmaxcol=200 "https://bluz71.github.io/2017/05/15/vim-tips-tricks.html

"CursorLineNr only on active buffer
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
  set breakindent
  let &showbreak='⤷  '
endif

" maps
"------------------------------------------------------------------------------

noremap <F5> :so ~/.vimrc<cr>

noremap E g_
noremap B ^
nnoremap Y y$

"allow dot work on selection as it would on normal
xnoremap . :norm.<CR>

noremap <leader>w :w<cr>
noremap <leader>cd :lcd %:p:h<cr>
noremap <leader>rf :cfdo %s/old/new | update
noremap <leader>/ /\V
noremap <leader>cq :cclose<cr>

nnoremap <leader>r :%s///gc<left><left><left><left>
vnoremap <leader>r :s///gc<left><left><left><left>

"nav jumplist
nnoremap ]j g,
nnoremap [j g;

"change to insert mode and create a linebreak on carret's position
noremap <C-o> i<cr>

"graphical moving when in normal mode
"https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

vnoremap // y/<C-R>"<CR>

nnoremap <silent> coq :call HelperQuickFixToggle()<cr>

" auto settings
"------------------------------------------------------------------------------

"defaults editor setting. better using editorconfig instead!
autocmd FileType {javascript,html,svg,css,stylus,sass,scss,htmldjango} set tabstop=2 sts=2 sw=2 noexpandtab
autocmd FileType {json,python,ruby,sh,vim,yaml} set tabstop=2 sts=2 sw=2 expandtab

" specific theme for diff buffers
" autocmd BufNewFile,BufRead * if &diff | colorscheme distinguished | endif

" linking formats with filtypes
autocmd BufNewFile,BufRead *.{bash} set filetype=sh syntax=sh
autocmd BufNewFile,BufRead *.{cshtml} set filetype=html syntax=html bomb
autocmd BufNewFile,BufRead *.{njk} set filetype=html syntax=htmldjango
autocmd BufNewFile,BufRead *.{styl,stylus} set filetype=stylus syntax=stylus
autocmd BufNewFile,BufRead *.{tag,ejs} set filetype=html syntax=html

autocmd BufWritePre * call HelperStripTrailingWhitespace()
