require("trouble").setup({
	mode = "document_diagnostics"
})

vim.keymap.set('n', '<leader>xw', [[<cmd>TroubleToggle workspace_diagnostics<cr>]], {})
vim.keymap.set('n', '<leader>xx', [[<cmd>TroubleToggle document_diagnostics<cr>]], {})
