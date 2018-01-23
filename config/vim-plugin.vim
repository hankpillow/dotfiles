
" plugins setup
"------------------------------------------------------------------------------

filetype off

call plug#begin('~/.vim/bundle')

"themes
Plug 'Lokaltog/vim-distinguished'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
" Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'reedes/vim-colors-pencil'
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
Plug 'junegunn/fzf', { 'do': './install --all' } "https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim' "https://github.com/junegunn/fzf.vim

call plug#end()

"vim-bbye
noremap <leader>d :Bdelete<cr>

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }

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
let g:grepper.open = 1
let g:grepper.tools = ['rg', 'git', 'ag', 'grep', 'ack']

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

nnoremap <leader>ff :Grepper -highlight<cr>
nnoremap <leader>fb :Grepper -highlight -buffers<cr>
nnoremap <leader>fw :Grepper -cword -noprompt<cr>

"fzf
nmap <leader>F :Files<cr>
nmap <leader>f :GFiles<cr>
nmap <leader>b :Buffers<cr>
