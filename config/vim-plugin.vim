
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
Plug 'kshenoy/vim-signature' "handle marks https://github.com/kshenoy/vim-signature
Plug 'ternjs/tern_for_vim'
Plug 'majutsushi/tagbar' "https://github.com/majutsushi/tagbar
Plug 'editorconfig/editorconfig-vim' "https://github.com/editorconfig/editorconfig-vim
Plug 'justinmk/vim-dirvish'  "navigate on dir inside a buffer
Plug 'mattn/emmet-vim' "like html snipts  http://mattn.github.io/emmet-vim/
Plug 'mhinz/vim-grepper' "search tool using ag/rg/git etc https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt
Plug 'moll/vim-bbye' "manage closing buffers properly https://github.com/moll/vim-bbye
Plug 'rstacruz/sparkup' "https://github.com/rstacruz/sparkup

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
