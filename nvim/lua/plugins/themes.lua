return {
	{
		"nvim-tree/nvim-web-devicons", -- https://github.com/nvim-tree/nvim-web-devicons
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = true,
				default = true,
			})
		end,
	},
	{
		"goolord/alpha-nvim", -- https://github.com/goolord/alpha-nvim (start window)
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"nvim-lualine/lualine.nvim", -- https://github.com/nvim-lualine/lualine.nvim
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "PaperColor",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode", "branch" },
					lualine_b = { { "filename", path = 1 } },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "location" },
					lualine_z = { "encoding", { "filetype", icons_enabled = false } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{
		"rose-pine/neovim", -- https://github.com/rose-pine/neovim
		-- config = function()
		-- 	require("rose-pine").setup({
		-- 		variant = "main", -- auto, main, moon, or dawn
		-- 		dark_variant = "moon", -- main, moon, or dawn
		-- 		dim_inactive_windows = false,
		-- 		extend_background_behind_borders = true,
		-- 		styles = {
		-- 			bold = false,
		-- 			italic = false,
		-- 			transparency = false,
		-- 		},
		-- 	})
		-- 	vim.cmd("colorscheme rose-pine")
		-- end,
	},
	{
		"zootedb0t/citruszest.nvim",
		config = function()
			vim.cmd([[
		colorscheme citruszest
		highlight ColorColumn ctermbg=0 guibg=black
		]])
		end,
	}, -- https://github.com/zootedb0t/citruszest.nvim
	{
		"NLKNguyen/papercolor-theme",
		-- https://github.com/NLKNguyen/papercolor-theme
		-- config = function()
		-- 	vim.cmd([[
		-- colorscheme PaperColor
		-- ]])
		-- end,
	},
	{
		"dracula/vim", -- https://draculatheme.com/vim
		name = "dracula",
	},
	"sjl/badwolf", -- https://github.com/sjl/badwolf/
	"morhetz/gruvbox", -- https://github.com/morhetz/gruvbox
	"folke/tokyonight.nvim", -- https://github.com/folke/tokyonight.nvim
	"zSnails/cityscape.nvim", -- https://github.com/zSnails/cityscape.nvim
	"iagorrr/noctis-hc.nvim", -- https://github.com/iagorrr/noctis-hc.nvim
}
-- "sonph/onehalf", -- https://github.com/sonph/onehalf/tree/master/vim
-- "jnurmine/Zenburn", -- https://github.com/jnurmine/Zenburn
-- "arcticicestudio/nord-vim", -- https://www.nordtheme.com/ports/vim
-- "raphamorim/vim-rio", -- https://github.com/raphamorim/vim-rio
