local me = require("me.util")
local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
			"hrsh7th/nvim-cmp", -- https://github.com/hrsh7th/nvim-cmp
		},
		---@class PluginLspOpts
		opts = function()
			return {
				---@type vim.diagnostic.Opts
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = false,
					severity_sort = true,
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.HINT] = " ",
							[vim.diagnostic.severity.INFO] = " ",
						},
					},
				},
				-- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
				-- Be aware that you also will need to properly configure your LSP server to
				-- provide the code lenses.
				codelens = {
					enabled = false,
				},
				document_highlight = {
					enabled = true,
				},
				capabilities = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
					textDocument = {
						completion = { completionItem = { snippetSupport = true } },
					},
				},
				format = {
					formatting_options = nil,
					timeout_ms = nil,
				},
			}
		end,
		config = function(_, opts)
			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_cmp and cmp_nvim_lsp.default_capabilities() or {},
				opts.capabilities or {}
			)

			lsp.preset("recommended")
			lsp.ensure_installed({
				"ts_ls",
				"vtsls",
				"angularls",
				"bashls",
				"stylelint_lsp",
				"eslint",
			})

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			lsp.on_attach(function(client, bufnr)
				vim.keymap.set(
					"n",
					"<C-h>",
					vim.diagnostic.open_float,
					{ desc = "Me: open fload diagnostic", buffer = bufnr, remap = false }
				)
				-- local active_clients = vim.lsp.get_active_clients()
				-- if client.name == "angularls" then
				-- 	for _, client_ in pairs(active_clients) do
				-- 		-- stop tsserver if denols is already active
				-- 		if client_.name == "tsserver" then
				-- 			print("stopping tsserver in favor of angularls")
				-- 			client_.stop()
				-- 		end
				-- 	end
				-- end
			end)

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			lspconfig.stylelint_lsp.setup({
				capabilities = capabilities,
				filetypes = { "css", "less", "sass" },
			})

			-- lspconfig.angularls.setup({
			-- 	capabilities = capabilities,
			-- 	autostart = false,
			-- 	root_dir = require("lspconfig.util").root_pattern("angular.json"),
			-- 	on_attach = function(client)
			-- 		-- Avoid conflict with tsserver rename
			-- 		client.server_capabilities.renameProvider = false
			-- 	end,
			-- })

			lspconfig.eslint.setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
						},
					},
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						},
					},
				},
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						importModuleSpecifierEnding = "minimal",
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})

			lsp.setup()
		end,
	},
}
