setlocal ts=2
setlocal sts=2
setlocal sw=2
setlocal expandtab
autocmd BufWritePre <buffer> call helper#StripTrailingWhitespace()
