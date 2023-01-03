require('fidget').setup()
require('luasnip')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader><space>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.diagnostic.config({ virtual_text = false })

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	local format_buffer = function()
		local withNull = {
			filter = function(client)
				return client.name == "null-ls"
			end
		}
		if vim.lsp.buf.format then
			vim.lsp.buf.format(withNull)
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting(withNull)
		end
	end

	-- Enable completion triggered by <c-x><c-o>

	nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
	nmap('<A-F>', format_buffer, '[G]oto [D]efinition')
	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('<F12>', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('<C-h>', vim.lsp.buf.hover, '[H]over Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	-- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	-- nmap('<F12>', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

	-- Lesser used LSP functionality
	-- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	-- nmap('<leader>wl', function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
	-- 	if vim.lsp.buf.format then
	-- 		vim.lsp.buf.format()
	-- 	elseif vim.lsp.buf.formatting then
	-- 		vim.lsp.buf.formatting()
	-- 	end
	-- end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lsp_config = require("lspconfig")

lsp_config['tsserver'].setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities
}

lsp_config['sumneko_lua'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}

lsp_config['angularls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp_config['bashls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lsp_config['cssls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lsp_config['dockerls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp_config['stylelint_lsp'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp_config['eslint'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp_config['html'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp_config['marksman'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
}
)

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
