
" user setting
"------------------------------------------------------------------------------

runtime macros/matchit.vim

" Remap the tab key to toggle current fold
nnoremap <Space> za

" Enable folding
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent

" no visual errors at all
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" allow unrestricted backspacing in insert mod
set backspace=indent,eol,start
set complete=.,w,b,t

" omnifuncs
" set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

" allow switching from changed buffers
set hidden

" remember more
set history=1000

" mouse for all
set mouse=a

" set shell=/bin/bash
if &shell =~# 'fish$'
	set shell=sh
endif

" make searching easier
set hlsearch
set smartcase
set incsearch
set showmatch

"no autobackups at all
set nobackup
set noswapfile
set nowritebackup

set nowrap
set pastetoggle=<f12>
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

noremap <leader>q :q<cr>
noremap <leader>w :w<cr>
noremap <leader>cd :lcd %:p:h<cr>
noremap <leader>rf :cfdo %s/old/new | update
noremap <leader>/ /\V

nnoremap <leader>r :%s///gc<left><left><left><left>
vnoremap <leader>r :s///gc<left><left><left><left>

nnoremap ]j g,
nnoremap [j g;

"https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

"copy selection on visual mode and start searching
"on the page for more results
vnoremap // y/<C-R>"<CR>

nnoremap <silent> coq :call HelperQuickFixToggle()<cr>

" https://github.com/rafaelrinaldi/dotfiles/blob/master/vimrc
" Load config per project if `.lvimrc` is present
if filereadable($PWD .'/.lvimrc')
  source ./.lvimrc
endif

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
