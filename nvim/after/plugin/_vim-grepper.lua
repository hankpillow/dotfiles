-- grepper config
vim.cmd([[
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>g :Grepper -highlight -tool git -side 
nnoremap <leader>G :Grepper -highlight -tool ag -side 
nnoremap <leader>gw :Grepper -highlight -tool git -cword <cr>
]])
