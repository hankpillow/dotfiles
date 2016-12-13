set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set shell=/bin/bash
set runtimepath+=~/.vim/bundle/Vundle.vim/

if &compatible
  set nocompatible
endif

"-----------------------------------------------------------------------------
" auto groups
"-----------------------------------------------------------------------------

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

autocmd BufNewFile,BufRead *.njk set filetype=html syntax=jinja
autocmd BufNewFile,BufRead *.{tag,ejs} set syntax=html filetype=html

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,tag,ejs setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType vim,javascript,sh,python,xml,yml,yaml,json,html autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype gitcommit setlocal textwidth=72

"in you don't have .editorconfig on your project
autocmd FileType yaml,ruby,python,vim,bash,sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html,javascript,xml,jsp setlocal ts=4 sts=4 sw=4 noexpandtab

"-----------------------------------------------------------------------------
" helpers
"-----------------------------------------------------------------------------

fun! StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endf

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

"===============================================================================
"Set Set Set Set
"===============================================================================

set hidden
set title
set history=1000
set backspace=indent,eol,start
set splitright
set splitbelow
set mouse=a
set mousefocus
set mousehide
set pastetoggle=<f12>
set hlsearch
set showmatch
set incsearch
set smartcase
set ignorecase

"autocomplete menus
set complete=.,w,b,t
set wildmenu wildmode=full
set wildignore+=.git,.svn,*.sw?,.DS_Store,node_modules,bower_components

"no autobackups at all
set nobackup nowritebackup noswapfile

set virtualedit=onemore
set nowrap
set autoindent

"------------------------------------------------------------------------------
" theme
"------------------------------------------------------------------------------

colorscheme gruvbox
set background=dark
set relativenumber
set list
set listchars=tab:▸\ ,eol:•,trail:—
set showbreak=↳
set cursorline
set colorcolumn=80

"------------------------------------------------------------------------------
" status line
"------------------------------------------------------------------------------

function! Fenc()
  if &fenc !~ "^$\|utf-8" || &bomb
    return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
  else
    return ""
  endif
endfunction

set laststatus=2

"file name
hi User1 ctermfg=49 ctermbg=8
"file readonly
hi User2 ctermfg=9 ctermbg=8
"modified
hi User3 ctermfg=15 ctermbg=8 cterm=bold
"ordinary text
hi User4 ctermfg=6 ctermbg=8
"inactive window
hi User5 ctermfg=7 ctermbg=none

function! Color(active, num, content)
  if a:active
    return '%' . a:num . '*' . a:content . '%*'
  else
    return a:content
  endif
endfunction

function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')

  let stat .= Color(1, 3, modified ? ' + ' : '')
  if active
    let stat .= Color(1, readonly ? 2 : 1, ' %f')
  else
    let stat .= Color(1, 5, ' %f')
  endif

  if winwidth(0) >= 70 && active
    let stat .= Color(1, 4, ' @' . buffer)
    if exists('*fugitive#head')
      let head = fugitive#head()
      if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
        call fugitive#detect(getcwd())
        let head = fugitive#head()
      endif
      let stat .= Color(1, 4, ' (' . head . ')')
    endif
    let stat .= Color(1, 4, '%=')
    let stat .= Color(1, 1, '%(%l,%c%V%)')
    let stat .= Color(1, 4, ' %y')
    let stat .= Color(1, 4, ' %{Fenc()}')
    let stat .= Color(1, 4, ' 0x%04B')
  else
    let stat .= Color(1,5,'%=')
  endif
  return stat
endfunction

" thanks for from https://github.com/blaenk/dots/blob/9843177fa6155e843eb9e84225f458cd0205c969/vim/vimrc.ln#L49-L64
function! SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  endfor
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END

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

"------------------------------------------------------------------------------
" plugin config
"------------------------------------------------------------------------------

" "commant-t
nnoremap <C-p> :CommandT<cr>

" "Ack
nnoremap /f :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gvdiff<cr>

"undotree
nnoremap <F3> :UndotreeToggle<cr>
