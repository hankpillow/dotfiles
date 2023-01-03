require("trouble").setup()
vim.cmd([[
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xx <cmd>TroubleToggle document_diagnostics<cr>
]])
