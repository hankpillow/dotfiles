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

let &statusline = winwidth(0)>80 ? s:statusline_expr() : '%t'

set title
set listchars=tab:▸\ ,eol:•,trail:—,space:␣
set number relativenumber

silent! colorscheme peachpuff
" silent! colorscheme koehler
hi StatusLine ctermbg=0 guibg=Black

if has('linebreak')
  set breakindent
  let &showbreak='↳ '
endif

