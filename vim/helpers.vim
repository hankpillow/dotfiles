
"helper functions
"------------------------------------------------------------------------------

function! HelperLastSearch()
  echo @/
endfunction

function! HelperRemoveEmptyLines()
  g/^\s*$/d
endfunction

function! HelperMatches()
  %s///n
endfunction

function! HelperHexOff()
  %!xxd -r
endfunction

function! HelperHexOn()
  %!xxd
endfunction

function! HelperSingleEmptyLines()
  %!cat -s
endfunction

function! HelperStripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

function! HelperQuickFixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endfunction

