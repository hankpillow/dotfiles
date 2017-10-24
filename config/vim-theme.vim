" theme
"------------------------------------------------------------------------------

function! CheckBackground()
	if &background == 'light'
		" Range:   252 (darkest) ~ 256 (lightest)
		silent! colorscheme seoul256-light
		let g:seoul256_background = 255
	else
		" Range:   233 (darkest) ~ 239 (lightest)
		silent! colorscheme seoul256
		let g:seoul256_background = 234
	endif
endfunction

" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set synmaxcol=200

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

