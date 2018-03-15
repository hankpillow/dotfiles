
" user setting
"------------------------------------------------------------------------------

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

syntax enable

filetype plugin indent on

" allow unrestricted backspacing in insert mod
set backspace=indent,eol,start
set complete=.,w,b,t

" omnifuncs
set omnifunc=syntaxcomplete#Complete
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
" set ignorecase
" set infercase "https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
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

set wildignore+=*.jpe?g,*.bmp,*.gif,*.png
set wildignore+=*.mp3,*.mpeg4,*.mp4,*.mov,*.flv,*.mkv
set wildignore+=*.eot,*.ttf,*.woff,*.woff2
set wildignore+=*.sw?,*.nupkg,*.dll,*.exe
set wildignore+=.DS_Store,thumbs.db
set wildignore+=node_modules/,bower_components/
set wildignore+=.git/,.svn/

" maps
"------------------------------------------------------------------------------

noremap <F5> :so ~/.vimrc<cr>

noremap E g_
noremap B ^
nnoremap Y y$

"allow dot work on selection as it would on normal
xnoremap . :norm.<CR>

noremap <leader>q :q<cr>
noremap <leader>w :w<cr>
noremap <leader>cd :lcd %:p:h<cr>
noremap <leader>rf :cfdo %s/old/new | update
noremap <leader>/ /\V

nnoremap <leader>r :%s///gc<left><left><left><left>
vnoremap <leader>r :s///gc<left><left><left><left>

"nav jumplist
nnoremap ]j g,
nnoremap [j g;

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

"forcing syntaxes
autocmd BufNewFile,BufRead *.{js} set filetype=javascript
autocmd BufNewFile,BufRead *.{bash} set filetype=sh syntax=sh
autocmd BufNewFile,BufRead *.{cshtml} set filetype=html syntax=html bomb
autocmd BufNewFile,BufRead *.{njk} set filetype=html syntax=htmldjango
autocmd BufNewFile,BufRead *.{styl,stylus} set filetype=stylus syntax=stylus
autocmd BufNewFile,BufRead *.{tag,ejs} set filetype=html syntax=html
autocmd BufRead,BufNewFile *.{eslint,babel}rc set filetype=json

autocmd BufWritePre * call HelperStripTrailingWhitespace()

" https://github.com/rafaelrinaldi/dotfiles/blob/master/vimrc
" Load config per project if `.lvimrc` is present
if filereadable($PWD .'/.lvimrc')
  source ./.lvimrc
endif
