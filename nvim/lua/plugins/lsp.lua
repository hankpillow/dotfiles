return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"folke/trouble.nvim",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")

			lsp.preset("recommended")

			lsp.ensure_installed({
				"tsserver",
				"angularls",
				"bashls",
				"stylelint_lsp",
				"eslint",
			})

			local root_pattern = require("lspconfig.util").root_pattern

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp.defaults.cmp_mappings({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			})

			cmp_mappings["<Tab>"] = nil
			cmp_mappings["<S-Tab>"] = nil

			vim.opt.signcolumn = "yes"
			vim.diagnostic.config({
				virtual_text = false,
			})

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings,
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
				vim.keymap.set("n", "<A-h>", vim.lsp.buf.hover, opts)
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
                            checkThirdParty = false
						},
					},
				},
			})

			lspconfig.stylelint_lsp.setup({
				autostart = false,
				filetypes = { "css", "html", "less", "sass" },
			})

			lspconfig.angularls.setup({
				autostart = true,
				root_dir = root_pattern("angular.json"),
				on_attach = function(client)
					-- Avoid conflict with tsserver rename
					client.server_capabilities.renameProvider = false
				end,
			})

			lspconfig.eslint.setup({
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

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.tsserver.setup({
				-- on_attach = on_attach,
				-- capabilities = capabilities,
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
