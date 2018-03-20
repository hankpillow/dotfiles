" user setting
"------------------------------------------------------------------------------

" reload vimrc when config is changed
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  let @/ = ""
augroup END

" auto close quickfix when it's the only buffer that has left
augroup quickfix_autoclose
  autocmd!
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
        \   q :cclose<cr>:lclose<cr>
  autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
        \   bd|
        \   q | endif
augroup end

" Enable built in omni completion
augroup omnifuncs
  autocmd!
  autocmd FileType css,scss,stylus setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,xhtml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript,jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

augroup end

" only activate for active window
augroup cursosline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup filetypes
  autocmd!

  "forcing ft for new formats
  autocmd BufRead,BufNewFile *.eslint{.js,rc} set filetype=json
  autocmd BufRead,BufNewFile *.babel{.js,rc} set filetype=json

  "remove white spaces
  autocmd BufWritePre *.{js,css,styl,scss,sass} call HelperStripTrailingWhitespace()

  "defaults editor setting. better using editorconfig instead!
  autocmd FileType {javascript,html,svg,css,stylus,sass,scss,htmldjango} set tabstop=2 sts=2 sw=2 noexpandtab
  autocmd FileType {json,python,ruby,sh,vim,yaml} set tabstop=2 sts=2 sw=2 expandtab

augroup end

" .Net validation
augroup cshtml
  autocmd!
  autocmd FileType cshtml set syntax=html bomb
augroup end

