if exists("g:EditorConfig_max_line_indicator")
  echom "editorconfig handle this"
else
  echom "setting text config..."
  setlocal tabstop=4
  setlocal sts=4
  setlocal sw=4
  setlocal noexpandtab
  autocmd BufWritePre <buffer> call helper#StripTrailingWhitespace()
endif
