-----------------------nvim-tree
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = { "node_modules" },
	},
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true
			}
		}
	}
})

vim.cmd([[
nnoremap - :NvimTreeToggle<CR>
vnoremap - :NvimTreeToggle<CR>

noremap <leader>b :NvimTreeFocus<CR>
vnoremap <leader>b :NvimTreeFocus<CR>
]])
