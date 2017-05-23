function! helper#RemoveEmptyLines()
  g/^\s*$/d
endfunction

function! helper#HexOff()
  %!xxd -r
endfunction

function! helper#HexOn()
  %!xxd
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

function! helper#QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
