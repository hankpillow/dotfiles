-- https://github.com/sindrets/diffview.nvim
return {
	"sindrets/diffview.nvim",
	event = "BufEnter",
	config = function()
		vim.keymap.set("n", "<leader>do", vim.cmd.DiffviewOpen)
		vim.keymap.set("n", "<leader>dc", vim.cmd.DiffviewClose)
		require("diffview").setup({
			diff_binaries = false,
			view = {
				default = {
					-- Config for changed files, and staged files in diff views.
					layout = "diff2_horizontal",
					winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
				},
				merge_tool = {
					-- Config for conflicted files in diff views during a merge or rebase.
					layout = "diff3_horizontal",
					disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
					winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
				},
				file_history = {
					-- Config for changed files in file history views.
					layout = "diff2_horizontal",
					winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
				},
			},
			file_panel = {
				listing_style = "tree", -- One of 'list' or 'tree'
				tree_options = { -- Only applies when listing_style is 'tree'
					flatten_dirs = true, -- Flatten dirs that only contain one single dir
					folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
				},
				win_config = { -- See ':h diffview-config-win_config'
					position = "left",
					width = 35,
					win_opts = {},
				},
			},
		})
	end,
}
