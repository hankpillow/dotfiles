require("gitsigns").setup()

require("trouble").setup()

require("rose-pine").setup({
	disable_italics = true
})

require("nvim-web-devicons").setup({
	color_icons = true;
	default = true;
})

vim.cmd([[
colorscheme rose-pine
]])
