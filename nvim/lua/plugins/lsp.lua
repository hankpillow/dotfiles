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
				-- options for vim.diagnostic.config()
				---@type vim.diagnostic.Opts
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = false,
					--  virtual_text = {
					-- 	spacing = 4,
					-- 	source = "if_many",
					-- 	prefix = "●",
					-- 	-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- 	-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- 	-- prefix = "icons",
					-- },
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
				-- Enable lsp cursor word highlighting
				document_highlight = {
					enabled = true,
				},
				-- add any global capabilities here
				capabilities = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				},
				-- options for vim.lsp.buf.format
				-- `bufnr` and `filter` is handled by the LazyVim formatter,
				-- but can be also overridden when specified
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

			-- diagnostics signs
			if vim.fn.has("nvim-0.10.0") == 1 then
				-- code lens
				if opts.codelens.enabled and vim.lsp.codelens then
					me.on_supports_method("textDocument/codeLens", function(client, buffer)
						vim.lsp.codelens.refresh()
						vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
							buffer = buffer,
							callback = vim.lsp.codelens.refresh,
						})
					end)
				end
				if
					type(opts.diagnostics.virtual_text) == "table"
					and opts.diagnostics.virtual_text.prefix == "icons"
				then
					opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
						or function(diagnostic)
							local icons = opts.diagnostics.signs.text
							for d, icon in pairs(icons) do
								if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
									return icon
								end
							end
						end
				end
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			lsp.on_attach(function(client, bufnr)
				vim.keymap.set(
					"n",
					"gS",
					":FzfLua lsp_document_symbols<cr>",
					{ desc = "Me: lsp document symbols", buffer = bufnr, remap = false }
				)
				vim.keymap.set(
					"n",
					"<C-h>",
					vim.diagnostic.open_float,
					{ desc = "Me: open fload diagnostic", buffer = bufnr, remap = false }
				)
				vim.keymap.set(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "Me: show code actions", buffer = bufnr, remap = false }
				)
				vim.keymap.set(
					"n",
					"<leader>ti",
					":lua require'me.util'.toggle.inlay_hint()<cr>",
					{ desc = "Me: Toggle inlay hints" }
				)
				vim.keymap.set(
					"n",
					"<leader>td",
					":FzfLua diagnostics_document<cr>",
					{ desc = "Me: Toggle inlay hints" }
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
