return {
	-- https://github.com/nvim-lualine/lualine.nvim
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
				always_divide_middle = false,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"buffers",
						use_mode_colors = true,
						hide_filename_extension = false,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "branch", "diff" },
				lualine_y = { "filesize" },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
