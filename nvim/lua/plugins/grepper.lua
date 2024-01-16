return {
	"mhinz/vim-grepper",
	config = function()
		vim.cmd([[
         nmap gs  <plug>(GrepperOperator)
         xmap gs  <plug>(GrepperOperator)
         ]])

		vim.keymap.set("n", "<C-g>", ":Grepper -highlight -tool rg<cr>", { desc = "Grep files using rg" })
		vim.keymap.set(
			"n",
			"<A-g>",
			":Grepper -highlight -cword -tool rg<cr>",
			{ desc = "Grep files using rg using word under cursor" }
		)
	end,
}
