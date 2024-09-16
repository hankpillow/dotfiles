return {
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			vim.treesitter.language.register("markdown", "mdx")
			require("nvim-treesitter.configs").setup({
				modules = {},
				ignore_install = {},
				ensure_installed = {
					"bash",
					"css",
					"fish",
					"gitignore",
					"html",
					"javascript",
					"json",
					"lua",
					"typescript",
					"vim",
					"yaml",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = true,
					},
				},
				disable = function(lang, buf)
					if lang == "help" then
						return true
					end
					local max_filesize = 150 * 1024 -- 150KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
			})
		end,
	},
}
