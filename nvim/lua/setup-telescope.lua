-----------------------telescope
require('telescope').setup({
	file_ignore_patterns = {
		"node_modules",
		".cache",
		"dist",
		"public"
	}
})

vim.cmd([[
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <A-P> <cmd>Telescope<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>br <cmd>Telescope git_branches<cr>
]])

