
-----------------------treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		"bash",
		"css",
		"fish",
		"gitignore",
		"html",
		"javascript",
		"json",
		"lua",
		"typescript",
		"vim",
		"vim",
		"yaml"
	},
	auto_install = true,
	highlight = {
		additional_vim_regex_highlighting = false,
		enable = true
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true
	},
}
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable 
]])
