-----------------------telescope
require('telescope').setup({
	file_ignore_patterns = {
		"node_modules",
		".cache",
		"dist",
		"public"
	}
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.cmd([[
nnoremap <C-p> <cmd>Telescope find_files previewer=false<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b>fb <cmd>Telescope buffers previewer=false<cr>
nnoremap <A-P> <cmd>Telescope commands<cr>
nnoremap <leader>t <cmd>Telescope<cr>
nnoremap <space>? <cmd>Telescope oldfiles<cr>
nnoremap <leader>br <cmd>Telescope git_branches previewer=false<cr>
]])

