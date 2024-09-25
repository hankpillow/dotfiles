return {
	-- "tpope/vim-commentary", -- https://github.com/tpope/vim-commentary
	-- https://github.com/tpope/vim-surround
	{ "tpope/vim-surround", event = "BufEnter" },
	-- https://github.com/tpope/vim-unimpaired
	{ "tpope/vim-unimpaired", event = "BufEnter" },
	-- {
	-- 	"tpope/vim-fugitive", -- https://github.com/tpope/vim-fugitive
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		vim.cmd([[
	--            nnoremap <leader>gs :G<CR>
	--            nnoremap <leader>gw :Gwrite<CR>
	--            ]])
	-- 	end,
	-- },
}
