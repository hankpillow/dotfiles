setlocal tabstop=4
setlocal sts=4
setlocal sw=4
setlocal noexpandtab
autocmd BufWritePre <buffer> call helper#StripTrailingWhitespace()
