-- grepper config
vim.cmd([[
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>g :Grepper -side -tool git<cr>
nnoremap <leader>G :Grepper -side -tool ag<cr>
nnoremap <leader>gw :Grepper -side -cword -tool git<cr>
]])
