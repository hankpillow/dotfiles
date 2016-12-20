setlocal expandtab
setlocal shiftwidth=2
setlocal sts=2
setlocal tabstop=2
autocmd BufWritePre <buffer> call helper#StripTrailingWhitespace()
