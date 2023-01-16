local servers = {
	'tsserver',
	'sumneko_lua',
	'angularls',
	'bashls',
	'cssls',
	'dockerls',
	'stylelint_lsp',
	'eslint',
	'html',
	'marksman'
}

require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = servers,
	automatic_installation = false
}
