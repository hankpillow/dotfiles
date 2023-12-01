local iok, lsp = pcall(require, "lsp-zero")
local lok, lspconfig = pcall(require, "lspconfig")
local cok, cmp = pcall(require, "cmp")
local conk = pcall(require, "conform")

if not iok then
	print("missing lsp-zero")
	return
end

if not conk then
	print("missing conform")
	return
end

if not lok then
	print("missing lspconfig")
	return
end

if not cok then
	print("missing cmp")
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"angularls",
	"bashls",
	"stylelint_lsp",
	"eslint",
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

vim.opt.signcolumn = "yes"
lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<A-h>", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-h>", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp.configure("angularls", {
	autostart = true,
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
})

lspconfig.stylelint_lsp.setup({
	autostart = false,
	filetypes = { "css", "html", "less", "sass" },
})

lsp.configure("eslint", {
	filetypes = {
		"json",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})

lsp.setup()
