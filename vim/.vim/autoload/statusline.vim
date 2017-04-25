"right column
hi User1 ctermfg=15 ctermbg=14

"left column
hi User2 ctermfg=15 ctermbg=14

"modified flag
hi User3 ctermfg=14 ctermbg=11

function! statusline#Color(num, content)
    return '%' . a:num . '*' . a:content . '%*'
endfunction

function! statusline#GetStatus(winnr)
  let stat = statusline#Color(1,'')
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')

  if modified
    let stat .= statusline#Color(3, '[+]')
  endif
  let stat .= statusline#Color(1, readonly ? '[r] %f' : ' %f')

  if winwidth(0) >= 70 && active

    " buffer num
    let stat .= statusline#Color(1,' @' . buffer)

    if exists('*fugitive#head')
      let head = fugitive#head()

      if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
        call fugitive#detect(getcwd())
        let head = fugitive#head()
      endif

      "brach name when exists
      let stat .= statusline#Color(1,' {' . head . '}')
    endif

    "right column
    let stat .= statusline#Color(2,'%=')
    "cursor coords
    let stat .= statusline#Color(2,'%(%l,%c%V%)')
    "filetype and file encoding
    let stat .= statusline#Color(2,' %y %{strlen(&fenc)?&fenc:&enc} ')
    let stat .= statusline#Color(2,' %{&bomb?"BOM":""}')
    "bytecode under cursor
    let stat .= statusline#Color(2,' 0x%04B')

  endif

  return stat

endfunction

function! statusline#RefreshStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!statusline#GetStatus('.nr.')')
  endfor
endfunction
