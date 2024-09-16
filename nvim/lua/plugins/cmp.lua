local kinds = {
	Array = " ",
	Boolean = "󰨙 ",
	Class = " ",
	Codeium = "󰘦 ",
	Color = " ",
	Control = " ",
	Collapsed = " ",
	Constant = "󰏿 ",
	Constructor = " ",
	Copilot = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = "󰊕 ",
	Interface = " ",
	Key = " ",
	Keyword = " ",
	Method = "󰊕 ",
	Module = " ",
	Namespace = "󰦮 ",
	Null = " ",
	Number = "󰎠 ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	String = " ",
	Struct = "󰆼 ",
	TabNine = "󰏚 ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = "󰀫 ",
}
return {
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
			"hrsh7th/cmp-path", -- https://github.com/hrsh7th/cmp-path
			"hrsh7th/cmp-buffer", -- http://github.com/hrsh7th/cmp-buffer
			"hrsh7th/cmp-cmdline", -- https://github.com/hrsh7th/cmp-cmdline
			"hrsh7th/cmp-nvim-lua", -- https://github.com/hrsh7th/cmp-nvim-lua
			-- "L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
			-- {
			-- 	"zbirenbaum/copilot.lua", -- https://github.com/zbirenbaum/copilot.lua
			-- 	cmd = "Copilot",
			-- 	build = ":Copilot auth",
			-- 	-- event = "InsertEnter",
			-- },
			-- "zbirenbaum/copilot-cmp", -- https://github.com/zbirenbaum/copilot-cmp
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				auto_brackets = {}, -- configure any filetype to auto add brackets
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
					{ name = "nvim_lua" },
				}),
				formatting = {
					format = function(_, item)
						if kinds[item.kind] then
							item.kind = kinds[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
		--- @param opts cmp.ConfigSchema | {auto_brackets?: string[]}
		config = function(_, opts)
			for _, source in pairs(opts.sources) do
				source.group_index = source.group_index or 1
			end

			local cmp = require("cmp")
			cmp.setup(opts)

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

			-- cmp.event:on("menu_opened", function()
			-- 	vim.b.copilot_suggestion_hidden = true
			-- end)
			-- --
			-- cmp.event:on("menu_closed", function()
			-- 	vim.b.copilot_suggestion_hidden = false
			-- end)
		end,
	},
}
-- require("copilot_cmp").setup()

-- local cmp = require("cmp")
-- cmp.setup({
-- 	sources = {
-- 		{ name = "copilot" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "path" },
-- 		{ name = "nvim_lua" },
-- 		{
-- 			name = "buffer",
-- 			option = {
-- 				get_bufnrs = function()
-- 					local bufs = {}
-- 					for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 						bufs[vim.api.nvim_win_get_buf(win)] = true
-- 					end
-- 					return vim.tbl_keys(bufs)
-- 				end,
-- 			},
-- 		},
-- 	},
-- 	snippet = {
-- 		-- expand = function(args)
-- 		-- 	require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
-- 		-- end,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		-- documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
-- 		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
-- 		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
-- 		["<CR>"] = nil,
-- 		["<S-Tab>"] = nil,
-- 		-- ["<Tab>"] = nil,
-- 		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 		-- ["<Tab>"] = cmp.mapping(function(fallback)
-- 		-- 	if cmp.visible() then
-- 		-- 		cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
-- 		-- 	elseif require("copilot.suggestion").is_visible() then
-- 		-- 		require("copilot.suggestion").accept()
-- 		-- 	elseif has_words_before() then
-- 		-- 		cmp.complete()
-- 		-- 	else
-- 		-- 		fallback()
-- 		-- 	end
-- 		-- end, { "i", "s" }),
-- 	}),
-- })
