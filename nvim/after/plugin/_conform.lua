local ok, plugin = pcall(require, "conform")
if not ok then
	print("missing stevearc/conform.nvim")
	return
end

-- https://github.com/stevearc/conform.nvim
local frontend_code = { { "prettier", "eslint" } }
local frontend_style = { { "prettier", "stylelint" } }
plugin.setup({
	log_level = vim.log.levels.ALL,
	formatters_by_ft = {
		javascript = frontend_code,
		typescript = frontend_code,
		typescriptreact = frontend_code,
		xml = frontend_code,
		html = frontend_style,
		scss = frontend_style,
		css = frontend_style,
		lua = { { "stylua" } },
		["*"] = { { "codespell" } },
	},
	notify_on_error = true,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set({ "n", "v" }, "<A-F>", function()
	plugin.format({ async = true, lsp_fallback = false, quiet = false })
end, { noremap = true, silent = false })
