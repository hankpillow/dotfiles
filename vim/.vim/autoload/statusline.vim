"file name
hi User1 ctermfg=49 ctermbg=8
"file readonly
hi User2 ctermfg=9 ctermbg=8
"modified
hi User3 ctermfg=15 ctermbg=8 cterm=bold
"ordinary text
hi User4 ctermfg=6 ctermbg=8
"inactive window
hi User5 ctermfg=7 ctermbg=none

function! statusline#Color(active, num, content)
  if a:active
    return '%' . a:num . '*' . a:content . '%*'
  else
    return a:content
  endif
endfunction

function! statusline#Fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! stausline#GetStatus(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')

  let stat .= statusline#Color(1, 3, modified ? ' + ' : '')
  if active
    let stat .= statusline#Color(1, readonly ? 2 : 1, ' %f')
  else
    let stat .= statusline#Color(1, 5, ' %f')
  endif

  if winwidth(0) >= 70 && active
    let stat .= Color(1, 4, ' @' . buffer)
    if exists('*fugitive#head')
      let head = fugitive#head()
      if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
        call fugitive#detect(getcwd())
        let head = fugitive#head()
      endif
      let stat .= statusline#Color(1, 4, ' (' . head . ')')
    endif
    let stat .= statusline#Color(1, 4, '%=')
    let stat .= statusline#Color(1, 1, '%(%l,%c%V%)')
    let stat .= statusline#Color(1, 4, ' %y')
    let stat .= statusline#Color(1, 4, ' %{statusline#Fenc()}')
    let stat .= statusline#Color(1, 4, ' 0x%04B')
  else
    let stat .= statusline#Color(1,5,'%=')
  endif
  return stat
endfunction

function! statusline#SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!statusline#GetStatus('.nr.')')
  endfor
endfunction
