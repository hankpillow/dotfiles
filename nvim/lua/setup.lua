
local null_ls = require("null-ls")
local devicons = require( 'nvim-web-devicons' )

devicons.setup({
		-- your personnal icons can go here (to override)
		-- you can specify color or cterm_color instead of specifying both of them
		-- DevIcon will be appended to `name`
		--- override = {
		--- 	zsh = {
		--- 		icon = "",
		--- 		color = "#428850",
		--- 		cterm_color = "65",
		--- 		name = "Zsh"
		--- 	}
		--- };
		-- globally enable different highlight colors per icon (default to true)
		-- if set to false all icons will have the default icon's color
		color_icons = true;
		-- globally enable default icons (default to false)
		-- will get overriden by `get_icons` option
		default = true;
	})

null_ls.setup({
		debug = true,
		sources = {
			-- null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.diagnostics.eslint,
			-- null_ls.builtins.completion.spell,
		},
	})

