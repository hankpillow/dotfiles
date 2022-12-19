-----------------------nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_root = true,
		-- ignore_list = {},
	},
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true
			}
		}
	}
	}	
)

vim.cmd([[
nnoremap - :NvimTreeToggle<CR>
vnoremap - :NvimTreeToggle<CR>

noremap <leader>b :NvimTreeFocus<CR>
vnoremap <leader>b :NvimTreeFocus<CR>
]])
