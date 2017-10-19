
" theme
"------------------------------------------------------------------------------

" silent! colorscheme peachpuff
" silent! colorscheme PaperColor

colorscheme seoul256
let g:seoul256_background = 236
" set background=dark

highlight Comment cterm=italic gui=italic
highlight CursorLineNr cterm=bold gui=bold

set synmaxcol=200 "https://bluz71.github.io/2017/05/15/vim-tips-tricks.html

"CursorLineNr only on active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set title

set listchars=tab:▸\ ,eol:•,trail:—
set number relativenumber

if has('linebreak')
  set breakindent
  let &showbreak='⤷  '
endif

