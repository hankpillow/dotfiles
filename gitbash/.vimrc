scriptencoding utf-8

if &compatible
	set nocompatible
endif
set runtimepath+=~/.vim/bundle/neobundle.vim/

silent function! OSX()
	return has('macunix')
endfunction
silent function! LINUX()
	return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
	return  (has('win32') || has('win64'))
endfunction

""http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! StripTrailingWhitespace()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

function! DuplicateLine()
	let l = line(".")
	let c = col(".")
	norm YP
	call cursor(l+1,c)
endfunction

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	let @/ = ""
augroup END

""===============================================================================
""Set Set Set Set
""===============================================================================
"
if has('clipboard')
	if has('unnamedplus')
		" When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else
		" On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

if !has('gui')
	" Make arrow and other keys work
	set term=$TERM
endif

if has("autocmd")
	filetype on
endif

set laststatus=2
set hlsearch
set smartcase
set wildmenu
set wildmode=list:longest,full
set nobackup
set nowb
set noswapfile
set showmode
set nowrap
set wildignore+=node_modules,bower_components
set tabstop=4 "Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4 "Returns the effective value of 'shiftwidth'. This is the 'shiftwidth' value unless it is zero, in which case it is the 'tabstop' value.
set noexpandtab "dont expand tabs into spaces

set completeopt=menu,preview,longest
set number
set relativenumber
set history=1000
set hidden
set backspace=indent,eol,start
set showmatch "show matching brackets/parentethesis
set incsearch "find as you type
set ignorecase
set autoindent
set scrolloff=5 "keep the curtose 5 lines from window borders
set splitright "put vsplit to the right of current
set splitbelow "put split window bottom of the current
set pastetoggle=<F12>

""-----------------------------------------------------------------------------
""THEME
""-----------------------------------------------------------------------------
colorscheme default
set background=dark
set t_Co=256
set list
set list
set listchars=tab:▸\ ,eol:•,trail:—
set showbreak=↳
set nolist
set mouse=c

""------------------------------------------------------------------------------
"" Status line
""------------------------------------------------------------------------------
set statusline=
set statusline+=\ %f
set statusline+=\ @%{bufnr('%')} "buffer number
set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %r "modified readonly filetype
set statusline+=%=
set statusline+=%(line:\ %l\/%L,\ col:\ %c%V%)
set statusline+=\ %{strlen(&fenc)?&fenc:'none'}\  "file encoding
set statusline+=%{&ff} "file format

"changing bar color based on document's changes
function! CheckDocStatus()
	if &mod == 1
		hi statusline guibg=Yellow guifg=Black
	else
		hi statusline guibg=#B2B2B2 guifg=Black
	endif
endfunction


""------------------------------------------------------------------------------
""Auto command
""------------------------------------------------------------------------------

"status line autocmd
autocmd InsertEnter * hi statusline guibg=Green guifg=Black
autocmd InsertLeave * call CheckDocStatus()

autocmd FileType * autocmd BufWritePre <buffer> call CheckDocStatus()
autocmd FileType vim,javascript,sh,python,xml,yml,json,html autocmd BufWritePre <buffer> call StripTrailingWhitespace()

"good for riot templates
autocmd BufNewFile,BufRead *.tag set syntax=html
autocmd BufNewFile,BufRead *.tag set filetype=html
"nodejs ejs template files
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.ejs set syntax=html
"Vim-Jinja2
autocmd BufNewFile,BufRead *.njk set filetype=jinja
autocmd BufNewFile,BufRead *.njk set syntax=jinja

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,tag,ejs setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"
""------------------------------------------------------------------------------
"" <leader> maps
""------------------------------------------------------------------------------
"
""change explorer to file's directory
noremap <leader>cd :lcd %:p:h<cr>
""toggle word wrapping lines
noremap <leader>ww :set wrap!<cr>
""resize buffer equally" Status line
noremap <Leader>= <C-w>=
""split window vertically and loads the actual buffer
noremap <leader>bb :vert sb<cr>
""close current buffer without saving
noremap <leader>bd :bdelete<cr>
""split all buffers into tabs
noremap <leader>ta :tab sball<cr>
""open current buffer on tab
noremap <leader>tt :tabedit %<cr>
""create new empty tab
noremap <leader>tn :tabnew<cr>
"
""nav on windows
noremap <leader>a <C-w>h
noremap <leader>d <C-w>l
noremap <leader>w <C-w>k
noremap <leader>s <C-w>j
"
""every search starts with 'magic' flag
noremap <leader>r :%s/\V
"
""------------------------------------------------------------------------------
""<C> control maps
""------------------------------------------------------------------------------
"
noremap <silent><C-h> :set hlsearch!<cr>
""change to insert mode and create a linebreak on carret's position
noremap <C-CR> i<cr>
""duplucate current line
noremap <C-d> :call DuplicateLine()<cr>

""moving around
noremap <C-Left> :tabprev<cr>
noremap <C-Right> :tabnext<cr>
noremap <C-S-Left> :bnext<cr>
noremap <C-S-Right> :bprev<cr>

"" auto complete
inoremap <C-Space> <C-x><C-o>
inoremap <C-Tab> <C-n>

""------------------------------------------------------------------------------
"" arrow/move/etc maps
""------------------------------------------------------------------------------

""move as graphical way with arrow (good when wordwrapping)
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <Left> h
nnoremap <Right> l

map B ^
map E $

"every search starts with 'magic' flag
nnoremap / /\V

