-- grepper config
vim.cmd[[
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>g :Grepper -noopen -side -tool git<cr>
nnoremap <leader>G :Grepper -noopen -side -tool ag<cr>
]]
