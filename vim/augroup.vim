" user setting
"------------------------------------------------------------------------------

" reload vimrc when config is changed
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

" auto close quickfix when it's the only buffer that has left
augroup quickfix_settings
  autocmd!
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer> <CR> <CR><C-W>p:cclose<cr>
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>
  autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd | q | endif
  autocmd VimEnter,WinEnter,BufWinEnter quickfix setlocal nocursorline
augroup end

" Enable built in omni completion
augroup omnifuncs
  autocmd!
  autocmd FileType css,scss,stylus setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,xhtml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript,jsx,javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

augroup end

" only activate for active window
augroup cursosline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup end

augroup js_only
  autocmd!
  autocmd FileType javascript,javascript.jsx,jsx setlocal foldmethod=syntax
  set conceallevel=1
  map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
augroup end

augroup editorconfig
  autocmd!

  "remove white spaces
  autocmd BufWritePre *.{js,css,styl,scss,sass} call HelperStripTrailingWhitespace()

  "defaults editor setting. better using editorconfig instead!
  autocmd FileType {json} setlocal ft=javascript
  autocmd FileType {json,python,ruby,sh,vim,yaml,jsx,js,html,svg,css,stylus,sass,scss,htmldjango} setlocal tabstop=2 sts=2 sw=2 noexpandtab
augroup end

augroup twig
  autocmd!
  autocmd FileType twig set ft=html
augroup end

" .Net validation
augroup cshtml
  autocmd!
  autocmd FileType cshtml set syntax=html bomb
augroup end

