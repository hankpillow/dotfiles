-- https://github.com/stevearc/conform.nvim
return {
	"stevearc/conform.nvim",
	event = "BufEnter",
	ft = { "html", "htmlangular", "xml", "json", "typescript", "css", "sass", "typescriptreact", "lua" },
	config = function()
		local conform = require("conform")
		conform.setup({
			log_level = vim.log.levels.ALL,
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				xml = { "prettier" },
				html = { "prettier" },
				scss = { "prettier" },
				sass = { "prettier" },
				css = { "prettier" },
				lua = { "stylua" },
			},
			notify_on_error = true,
		})

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		vim.keymap.set({ "n", "v" }, "<A-F>", function()
			conform.format()
		end, { noremap = true, silent = false })
	end,
}
