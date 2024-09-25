return {
	-- https://github.com/nvim-lualine/lualine.nvim
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "citruszest",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "filename" },
				lualine_b = { "branch" },
				-- lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = { "mode" },
				lualine_y = { "filesize", "location" },
				lualine_z = { "encoding", { "filetype", icons_enabled = false } },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				-- lualine_c = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
