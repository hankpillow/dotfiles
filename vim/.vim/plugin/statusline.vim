scriptencoding utf-8
set laststatus=2

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call statusline:SetStatus()
augroup END

