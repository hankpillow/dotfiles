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
		-- https://github.com/bluz71/vim-moonfly-colors
		"bluz71/vim-moonfly-colors",
		-- name = "moonfly",
		-- config = function()
		-- 	vim.cmd([[colorscheme moonfly]])
		-- end,
	},
	{
		-- https://github.com/zootedb0t/citruszest.nvim
		"zootedb0t/citruszest.nvim",
		-- config = function()
		-- 	vim.cmd([[
		-- colorscheme citruszest
		-- highlight ColorColumn ctermbg=0 guibg=black
		-- ]])
		-- end,
	},
	{
		-- https://github.com/rose-pine/neovim
		"rose-pine/neovim",
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
		"diegoulloao/neofusion.nvim",
		-- config = function()
		--           require("neofusion").setup({
		-- 		terminal_colors = true,
		-- 		undercurl = true,
		-- 		underline = true,
		-- 		bold = true,
		-- 		strikethrough = true,
		-- 		invert_selection = false,
		-- 		invert_signs = false,
		-- 		invert_tabline = false,
		-- 		invert_intend_guides = false,
		-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
		-- 		palette_overrides = {},
		-- 		overrides = {},
		-- 		dim_inactive = false,
		-- 		transparent_mode = false,
		-- 	})
		-- 	vim.cmd("colorscheme neofusion")
		-- end,
	},
	{
		-- https://github.com/WTFox/jellybeans.nvim
		"wtfox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark",
			italic = false,
			palette = nil,
		},
		init = function()
			vim.cmd("colorscheme jellybeans")
		end,
	},
	{
		-- https://github.com/fnune/standard
		"fnune/standard",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	require("standard").setup({})
		-- 	vim.cmd("colorscheme standard")
		-- end,
	},
	-- https://github.com/NLKNguyen/papercolor-theme
	"NLKNguyen/papercolor-theme",
	-- https://github.com/sjl/badwolf/
	"sjl/badwolf",
	-- https://github.com/morhetz/gruvbox
	"morhetz/gruvbox",
	-- https://github.com/folke/tokyonight.nvim
	"folke/tokyonight.nvim",
	-- https://github.com/zSnails/cityscape.nvim
	"zSnails/cityscape.nvim",
	-- https://github.com/iagorrr/noctis-hc.nvim
	"iagorrr/noctis-hc.nvim",
	--- https://github.com/bluz71/vim-nightfly-colors
	"bluz71/vim-nightfly-colors",
}
-- "sonph/onehalf", -- https://github.com/sonph/onehalf/tree/master/vim
-- "jnurmine/Zenburn", -- https://github.com/jnurmine/Zenburn
-- "arcticicestudio/nord-vim", -- https://www.nordtheme.com/ports/vim
-- "raphamorim/vim-rio", -- https://github.com/raphamorim/vim-rio
-- "dracula/vim", -- https://draculatheme.com/vim
