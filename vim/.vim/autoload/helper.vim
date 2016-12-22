function! helper#RemoveEmptyLines()
  g/^\s*$/d
endfunction

function! helper#SingleEmptyLines()
  %!cat -s
endfunction

function! helper#StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
