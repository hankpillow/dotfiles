setlocal tabstop=8
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
autocmd BufWritePre <buffer> call helper#StripTrailingWhitespace()
