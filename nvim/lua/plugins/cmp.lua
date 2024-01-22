return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
			"hrsh7th/cmp-nvim-lua", -- https://github.com/hrsh7th/cmp-nvim-lua
			"hrsh7th/cmp-path", -- https://github.com/hrsh7th/cmp-path
			"hrsh7th/cmp-buffer", -- http://github.com/hrsh7th/cmp-buffer
			"hrsh7th/cmp-cmdline", -- https://github.com/hrsh7th/cmp-cmdline
			"hrsh7th/cmp-copilot", -- https://github.com/hrsh7th/cmp-copilot
			"L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Enter>"] = nil,
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
