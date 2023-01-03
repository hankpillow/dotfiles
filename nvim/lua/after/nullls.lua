local null_ls = require("null-ls")
null_ls.setup {
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylelint,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = '[eslintd] #{m}\n(#{c})'
		})
	}
}
