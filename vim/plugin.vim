
" plugins setup
"------------------------------------------------------------------------------

filetype off

call plug#begin('~/.vim/bundle')

"themes
" Plug 'Lokaltog/vim-distinguished'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'reedes/vim-colors-pencil'
Plug 'vim-scripts/summerfruit256.vim'

"syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'jelera/vim-javascript-syntax'
Plug 'wavded/vim-stylus'

"utils and tools
Plug 'kshenoy/vim-signature' "handle marks https://github.com/kshenoy/vim-signature
Plug 'editorconfig/editorconfig-vim' "https://github.com/editorconfig/editorconfig-vim
Plug 'mattn/emmet-vim' "html and css helpers  http://mattn.github.io/emmet-vim/
Plug 'mhinz/vim-grepper' "search tool using ag/rg/git etc https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt
Plug 'moll/vim-bbye' "manage closing buffers properly https://github.com/moll/vim-bbye
Plug 'airblade/vim-gitgutter' " handle git changes and show small signs https://github.com/airblade/vim-gitgutter
Plug 'justinmk/vim-dirvish' "liket netrw and Nerdtree

Plug 'tpope/vim-commentary' "https://github.com/tpope/vim-commentary
Plug 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround' "https://github.com/tpope/vim-surround
Plug 'tpope/vim-abolish' "https://github.com/tpope/tpope-vim-abolish
Plug 'tpope/vim-unimpaired' "https://github.com/tpope/vim-unimpaired
Plug 'junegunn/fzf', { 'do': './install --all' } "https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim'

call plug#end()

"vim-bbye
noremap <leader>d :Bdelete<cr>

"editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete

"grepper
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.quickfix = 1
let g:grepper.jump = 0
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.tools = ['rg', 'git', 'ag', 'grep', 'ack']
let g:grepper.ag = {'grepprg' : 'ag --vimgrep -- '}
let g:grepper.rg = {'grepprg' : 'rg -H --no-heading --vimgrep --hidden'}

nnoremap <leader>ff :Grepper -highlight<cr>
nnoremap <leader>fb :Grepper -highlight -buffers<cr>
nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '!'

let g:gitgutter_map_keys = 0
let g:gitgutter_diff_args = '-w'

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"fzf
nmap <leader>F :Files<cr>
nmap <leader>f :GFiles<cr>
nmap <leader>b :Buffers<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)

"emmet
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
autocmd FileType html,css EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'cshtml' : {
  \    'extends' : 'html',
  \  },
  \  'jsx' : {
  \    'extends' : 'html',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

filetype plugin indent on
syntax enable
