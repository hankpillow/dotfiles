
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
		"help",
		"json",
		"lua",
		"typescript",
		"vim",
		"vim",
		"yaml"
	},
	auto_install = true,
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
	},
}
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable 
]])
