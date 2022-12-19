-----------------------telescope
require('telescope').setup()

vim.cmd([[
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
]])

