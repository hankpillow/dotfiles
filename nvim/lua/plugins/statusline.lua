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
				theme = "jellybeans",
			},
			sections = {
				lualine_a = {
					{
						"filename",
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						path = 1,
						-- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory
						-- shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						-- for other components. (terrible name, any suggestions?)
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "branch", "diff" },
				lualine_y = { "filesize" },
				lualine_z = { {
					"searchcount",
					maxcount = 999,
					timeout = 500,
				} },
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
