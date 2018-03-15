" theme
"------------------------------------------------------------------------------

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? &filetype : ''}:%{len(&syntax) ? &syntax : ''} "
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let pos = '%(%l:%c%V%)-%P '
  let enc = '%{&fenc == "" ? &enc : &fenc}%{(exists("+bomb") && &bomb) ? ",bomb" : ""}'
  let path = "%{@%}"
  let grepper = '%{grepper#statusline()}'
  let sep = '%='
  return mod.path.' %<'.ro.fug.sep.' ('.grepper.') '.ft.' | '.pos.' | '.enc
endfunction
let &statusline = s:statusline_expr()

" function! CheckBackground()
" 	if &background == 'light'
" 		" Range:   252 (darkest) ~ 256 (lightest)
" 		let g:seoul256_background = 255
" 		silent! colorscheme seoul256
" 	else
" 		" Range:   233 (darkest) ~ 239 (lightest)
" 		" let g:seoul256_background = 234
" 		silent! colorscheme jellybeans
" 	endif
" endfunction

" set background=dark
" call CheckBackground()

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set title

set listchars=tab:▸\ ,eol:•,trail:—,space:␣
set number relativenumber

if has('linebreak')
  set breakindent
  let &showbreak='↳ '
endif

