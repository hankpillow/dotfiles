
" theme
"------------------------------------------------------------------------------

" silent! colorscheme peachpuff
silent! colorscheme PaperColor
set background=dark

set synmaxcol=200 "https://bluz71.github.io/2017/05/15/vim-tips-tricks.html

"CursorLineNr only on active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set title

set listchars=tab:▸\ ,eol:•,trail:—
set number
set relativenumber

if has('linebreak')
  set breakindent
  let &showbreak='⤷  '
endif

