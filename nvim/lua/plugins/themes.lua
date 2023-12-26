return {
	"rose-pine/neovim", -- https://github.com/rose-pine/neovim
	"sonph/onehalf", -- https://github.com/sonph/onehalf/tree/master/vim
	"jnurmine/Zenburn", -- https://github.com/jnurmine/Zenburn
	"sjl/badwolf", -- https://github.com/sjl/badwolf/
	"morhetz/gruvbox", -- https://github.com/morhetz/gruvbox
	"folke/tokyonight.nvim", -- https://github.com/folke/tokyonight.nvim
	"arcticicestudio/nord-vim", -- https://www.nordtheme.com/ports/vim
	"NLKNguyen/papercolor-theme", -- https://github.com/NLKNguyen/papercolor-theme
	"nvim-tree/nvim-web-devicons", -- https://github.com/nvim-tree/nvim-web-devicons
	"raphamorim/vim-rio", -- https://github.com/raphamorim/vim-rio
	"zSnails/cityscape.nvim", -- https://github.com/zSnails/cityscape.nvim
	"iagorrr/noctis-hc.nvim", -- https://github.com/iagorrr/noctis-hc.nvim
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
		"nvim-lualine/lualine.nvim", -- https://github.com/nvim-lualine/lualine.nvim
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "citruszest",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "filename", path = 1 } },
					lualine_c = { "branch" },
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
}
