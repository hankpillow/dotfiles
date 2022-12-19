-----------------------gitsigns
require('gitsigns').setup()

------------------------null-ls
local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.commitlint,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.completion.tags,
		null_ls.builtins.formatting.prettier,
		require("typescript.extensions.null-ls.code-actions"),
	},
})
