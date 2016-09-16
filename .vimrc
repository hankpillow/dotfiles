scriptencoding utf-8

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

augroup NetrwGroup
	  autocmd! BufEnter * call NormalizeWidths()
augroup END

autocmd BufNewFile,BufRead *.njk set filetype=html syntax=jinja
autocmd BufNewFile,BufRead *.{tag,ejs} set syntax=html filetype=html
autocmd BufRead,BufNewFile *.md,gitcommit setlocal spell complete+=kspell
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,tag,ejs setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType vim,javascript,sh,python,xml,yml,yaml,json,html autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype gitcommit setlocal textwidth=72

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

fun! VexToggle(dir)
	if exists("t:vex_buf_nr")
		call VexClose()
	else
		call VexOpen(a:dir)
	endif
endf

fun! VexOpen(dir)
	execute "Vexplore " . a:dir
	let t:vex_buf_nr = bufnr("%")
	wincmd H
	call VexSize(25)
endf

fun! VexClose()
	let cur_win_nr = winnr()
	let target_nr = (cur_win_nr == 1 ? winnr("#") : cur_win_nr)
	1wincmd w
	close
	unlet t:vex_buf_nr
	execute (target_nr - 1) . "wincmd w"
	call NormalizeWidths()
endf

fun! VexSize(vex_width)
	execute "vertical resize" . a:vex_width
	set winfixwidth
	call NormalizeWidths()
endf

fun! NormalizeWidths()
	let eadir_pref = &eadirection
	set eadirection=hor
	set equalalways! equalalways!
	let &eadirection = eadir_pref
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
noremap <leader>e :Vexplore<cr>
noremap <leader><tab> :call VexToggle("")<cr>

"-----------------------------------------------------------------------------
" plugins setup
"------------------------------------------------------------------------------

filetype off

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
"themes
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Lokaltog/vim-distinguished'
"all
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rstacruz/sparkup'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
call vundle#end()

syntax on
filetype plugin indent on

"===============================================================================
"Set Set Set Set
"===============================================================================

set title
set history=1000
set backspace=indent,eol,start
set splitright "put vsplit to the right of current
set splitbelow "put split window bottom of the current
set mouse=a "auto enable mouse usage
set mousehide "hide cursor while typing
set pastetoggle=fa
"search/highlight
set hlsearch "highlight search
set showmatch "show matching brackets/parentethesis
set incsearch "find as you type
set smartcase
set ignorecase

"autocomplete menus
set wildmenu wildmode=full
set wildignore+=.git,.svn,*.sw?,.DS_Store,node_modules,bower_components
set omnifunc=syntaxcomplete#Complete

"no autobackups at all
set nobackup nowritebackup noswapfile

"tabs, spaces, wrap and all indent
set nowrap
set tabstop=4
set shiftwidth=4
set noexpandtab "dont expand tabs into spaces
set autoindent
set virtualedit=onemore

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

set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ @%{bufnr('%')} "buffer number
set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %r "modified readonly filetype
set statusline+=%=
set statusline+=%(line:\ %l\/%L,\ col:\ %c%V%)
set statusline+=\ %{strlen(&fenc)?&fenc:'none'}\  "file encoding
set statusline+=%{&ff} "file format

"------------------------------------------------------------------------------
" <leader> maps
"------------------------------------------------------------------------------

"change explorer to file's directory
noremap <leader>cd :lcd %:p:h<cr>

"toggle word wrapping lines
noremap <leader>ww :set wrap!<cr>

"resize buffer equally
noremap <Leader>= <C-w>=

"split window vertically and loads the actual buffer
noremap <leader>bo :vert sb<cr>

"close current buffer without saving
noremap <leader>bd :bdelete<cr>

"every replace starts with 'magic' flag
noremap <leader>r :%s/\V

"every search starts with 'magic' flag
nnoremap / /\V

"remove empty lines
noremap <leader>em :g/^\s*$/d<cr>

"------------------------------------------------------------------------------
"<C> control maps
"------------------------------------------------------------------------------

noremap <silent><C-h> :set hlsearch!<cr>

"change to insert mode and create a linebreak on carret's position
noremap <C-o> i<cr>

"duplicate current line
noremap <C-d> yyp

"moving around
noremap <C-Right> :bnext<cr>
noremap <C-Left> :bprev<cr>

" auto complete
imap <C-Space> <C-X><C-O>
imap <C-Tab> <C-N>

"------------------------------------------------------------------------------
" arrow/move/etc maps
"------------------------------------------------------------------------------

"move as graphical way with arrow (good when wordwrapping)
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
nnoremap <Up> gk
nnoremap <Down> gj

"------------------------------------------------------------------------------
" plugin config
"------------------------------------------------------------------------------

"ctrlp
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
noremap <F5> :CtrlPClearCache<cr>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
