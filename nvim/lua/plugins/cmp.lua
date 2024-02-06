local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
			"hrsh7th/cmp-nvim-lua", -- https://github.com/hrsh7th/cmp-nvim-lua
			"hrsh7th/cmp-path", -- https://github.com/hrsh7th/cmp-path
			"hrsh7th/cmp-buffer", -- http://github.com/hrsh7th/cmp-buffer
			"hrsh7th/cmp-cmdline", -- https://github.com/hrsh7th/cmp-cmdline
			"L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
			{
				"zbirenbaum/copilot.lua", -- https://github.com/zbirenbaum/copilot.lua
				cmd = "Copilot",
				build = ":Copilot auth",
				event = "InsertEnter",
			},
			-- "zbirenbaum/copilot-cmp", -- https://github.com/zbirenbaum/copilot-cmp
		},
		config = function()
			-- Copilot setup
			require("copilot").setup({
				auto_trigger = false,
				panel = {
					enabled = true,
					auto_refresh = true,
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					accept = false, -- disable built-in keymapping
				},
				filetypes = {
					["*"] = false,
					javascript = true,
					typescript = true,
					python = true,
					lua = true,
					sh = true,
					fish = true,
					markdown = true,
					html = true,
					css = true,
					scss = true,
				},
			})

			-- require("copilot_cmp").setup()

			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
				},
				snippet = {
					-- expand = function(args)
					-- 	require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					-- end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-Space>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = nil,
					["<S-Tab>"] = nil,
					-- ["<Tab>"] = nil,
					-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
						elseif require("copilot.suggestion").is_visible() then
							require("copilot.suggestion").accept()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
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

			cmp.event:on("menu_opened", function()
				vim.b.copilot_suggestion_hidden = true
			end)

			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)
		end,
	},
}
