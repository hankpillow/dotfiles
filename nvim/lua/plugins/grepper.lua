return {
	"mhinz/vim-grepper",
	config = function()
		vim.cmd([[
         nmap gs  <plug>(GrepperOperator)
         xmap gs  <plug>(GrepperOperator)
         ]])

		vim.keymap.set("n", "<C-g>", ":Grepper -highlight -tool rg<cr>", { desc = "Grep files using rg" })
		vim.keymap.set(
			"v",
			"<C-g>",
			":Grepper -highlight -cword -tool rg<cr>",
			{ desc = "Grep files using rg using word under cursor" }
		)
		vim.keymap.set(
			"n",
			"<A-g>",
			":Grepper -side -tool rg<br>",
			{ desc = "Grep files using rg and open side window to check more item" }
		)
	end,
}
