return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
			"hrsh7th/nvim-cmp", -- https://github.com/hrsh7th/nvim-cmp
		},
		config = function()
			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lsp.preset("recommended")
			lsp.ensure_installed({
				"tsserver",
				"angularls",
				"bashls",
				"stylelint_lsp",
				"eslint",
			})

			vim.opt.signcolumn = "yes"
			vim.diagnostic.config({
				virtual_text = false,
			})

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
				-- vim.keymap.set("n", "<A-h>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-h>", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
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
				autostart = true,
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
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			lspconfig.stylelint_lsp.setup({
				capabilities = capabilities,
				autostart = false,
				filetypes = { "css", "html", "less", "sass" },
			})

			lspconfig.angularls.setup({
				capabilities = capabilities,
				autostart = false,
				root_dir = require("lspconfig.util").root_pattern("angular.json"),
				on_attach = function(client)
					-- Avoid conflict with tsserver rename
					client.server_capabilities.renameProvider = false
				end,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
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

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.tsserver.setup({
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
