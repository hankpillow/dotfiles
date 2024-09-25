-- https://github.com/mfussenegger/nvim-lint
return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}
		vim.keymap.set({ "n", "v" }, "<A-L>", function()
			print("linting")
			lint.try_lint()
		end, { noremap = true, silent = false })
	end,
}
