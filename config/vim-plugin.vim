
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
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

"syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'wavded/vim-stylus'

"utils and tools
Plug 'kshenoy/vim-signature' "handle marks https://github.com/kshenoy/vim-signature
Plug 'editorconfig/editorconfig-vim' "https://github.com/editorconfig/editorconfig-vim
Plug 'mattn/emmet-vim' "like html snipts  http://mattn.github.io/emmet-vim/
Plug 'mhinz/vim-grepper' "search tool using ag/rg/git etc https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt
Plug 'moll/vim-bbye' "manage closing buffers properly https://github.com/moll/vim-bbye
Plug 'rstacruz/sparkup' "https://github.com/rstacruz/sparkup
Plug 'justinmk/vim-dirvish' "liket netrw and Nerdtree

Plug 'tpope/vim-commentary' "https://github.com/tpope/vim-commentary
Plug 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround' "https://github.com/tpope/vim-surround
Plug 'tpope/vim-abolish' "https://github.com/tpope/tpope-vim-abolish
Plug 'tpope/vim-unimpaired' "https://github.com/tpope/vim-unimpaired
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'kien/ctrlp.vim' "https://github.com/kien/ctrlp.vim

call plug#end()

"vim-bbye
noremap <leader>d :Bdelete<cr>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"tern
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

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
let g:grepper.jump = 0
let g:grepper.jump = 0
let g:grepper.open = 1
let g:grepper.tools = ['rg', 'git', 'ag', 'grep', 'ack']

nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

nnoremap <leader>ff :Grepper -highlight<cr>
nnoremap <leader>fb :Grepper -highlight -buffers<cr>
nnoremap <leader>fw :Grepper -cword -noprompt<cr>

"fzf
nmap <leader>f :Files<cr>
nmap <leader>F :GFiles<cr>
nmap <leader>b :Buffers<cr>
