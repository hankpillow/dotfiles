return {
	"nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
	{
		"moll/vim-bbye", --- https://github.com/moll/vim-bbye
		config = function()
			vim.keymap.set("n", "<leader>d", ":Bdelete<CR>", { desc = "Delete current buffer" })
			vim.keymap.set("n", "<leader>D", ":bufdo :Bdelete<CR>", { desc = "Delete all buffers" })
		end,
	},
	{
		"romainl/vim-qf", -- https://github.com/romainl/vim-qf"
		config = function()
			vim.keymap.set(
				"n",
				"<leader>tq",
				"<Plug>(qf_qf_toggle)",
				{ desc = "Toggle quickfix window", noremap = true }
			)
		end,
	},
	"tpope/vim-commentary", -- https://github.com/tpope/vim-commentary
	"tpope/vim-surround", -- https://github.com/tpope/vim-surround
	"tpope/vim-unimpaired", -- https://github.com/tpope/vim-unimpaired
	{
		"tpope/vim-fugitive", -- https://github.com/tpope/vim-fugitive
		-- set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
		config = function()
			vim.cmd([[
            nnoremap <leader>gs :G<CR>
            nnoremap <leader>gw :Gwrite<CR>
            ]])
		end,
	},
	{
		"windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml", "mdx", "htm", "jsx", "tsx" },
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			})
		end,
	},
}
