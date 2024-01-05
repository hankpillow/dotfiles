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
		"airblade/vim-gitgutter", -- https://github.com/airblade/vim-gitgutter
		config = function()
			vim.keymap.set("n", "<leader>tgg", vim.cmd.GitGutterToggle, { desc = "Toggle gitgutter" })
			vim.keymap.set("n", "]h", vim.cmd.GitGutterNextHunk, { desc = "Prev git change" })
			vim.keymap.set("n", "[h", vim.cmd.GitGutterPrevHunk, { desc = "Next git change" })
			vim.keymap.set("n", "<F10>", vim.cmd.GitGutterPreviewHunk, { desc = "Preview git changes" })
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
	{
		"tpope/vim-markdown", -- https://github.com/tpope/vim-markdown,
		config = function()
			vim.g.markdown_fenced_languages = { "html", "python", "bash=sh" }
		end,
	},
	"tpope/vim-commentary", -- https://github.com/tpope/vim-commentary
	"tpope/vim-surround", -- https://github.com/tpope/vim-surround
	"tpope/vim-unimpaired", -- https://github.com/tpope/vim-unimpaired
	{
		"tpope/vim-fugitive", -- https://github.com/tpope/vim-fugitive
		config = function()
			vim.cmd([[
            set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
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
