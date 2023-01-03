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
""" open tree from current file
nnoremap - :NvimTreeOpen %:p:h<cr>
vnoremap - :NvimTreeOpen %:p:h<cr>

nnoremap <C-b> :NvimTreeToggle<CR>
vnoremap <C-b> :NvimTreeToggle<CR>
]])
