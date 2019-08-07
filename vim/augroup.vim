" user setting
"------------------------------------------------------------------------------

" reload vimrc when config is changed
augroup reload_vimrc
  autocmd!
  " echom "reload vimrc"
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

" auto close quickfix when it's the only buffer that has left
augroup quickfix_settings
  autocmd!
  " echom "quickfix window shortcuts"
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer> <CR> <CR><C-W>p:cclose<cr>
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>
  autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd | q | endif
  autocmd VimEnter,WinEnter,BufWinEnter quickfix setlocal nocursorline
augroup end

" Enable built in omni completion
augroup omnifuncs
  autocmd!
  " echom "set omnifunc"
  autocmd FileType css,scss,stylus setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,xhtml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript,jsx,javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" only activate for active window
augroup cursor_line
  autocmd!
  " echom "cursor line"
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup end

augroup code_settings
  autocmd!
  " echom "code setting..."
  autocmd FileType javascript,json,jsx,vim,Jenkinsfile,gradle,groov,yml,fish,yaml,ruby,python,sh setlocal tabstop=2 sts=2 sw=2 expandtab
  autocmd FileType javascript,json,jsx,vim,Jenkinsfile,gradle,groov,yml,fish,yaml,ruby,python,sh call HelperStripTrailingWhitespace()
  au BufNewFile,BufRead *.gradle,Jenkinsfile setf groovy
augroup end


augroup smell_javascript
  autocmd!
  " echom "auto js settings"
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd FileType sh,javascript,json,javascript.jsx,jsx,vim setlocal foldmethod=syntax
  set conceallevel=1
  map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
augroup end

augroup smell_html
  autocmd!
  autocmd FileType svg,twig,xhtml,xml set ft=html
  autocmd FileType html,php setlocal tabstop=2 sts=2 sw=2 noexpandtab
  autocmd FileType html,php,twig,xhtml,xml call HelperStripTrailingWhitespace()
augroup end

augroup smell_cshtml
  autocmd!
  autocmd FileType cshtml set syntax=html bomb
  autocmd FileType cshtml call HelperStripTrailingWhitespace()
  autocmd FileType cshtml setlocal tabstop=2 sts=2 sw=2 noexpandtab
augroup end

