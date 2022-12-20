
------------------------lspconfig
require'lspconfig'.eslint.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.angularls.setup{
	cmd = cmd,
	on_new_config = function(new_config,new_root_dir)
		new_config.cmd = cmd
	end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.cssls.setup {
	capabilities = capabilities,
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader><space>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.diagnostic.config({virtual_text = false})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- Mappings.
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', '<F12>', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<A-F>', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<C-.>', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>S', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<C-space>', vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', '<leader>re', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<leader>de', vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'tsserver', 'eslint', 'tailwindcss', 'angularls', 'cssls' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
		on_attach = on_attach
	}
end

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

require("typescript").setup({
	disable_commands = false, 
	debug = true,
	go_to_source_definition = {
		fallback = true,
	},
	server = { 
		on_attach = on_attach
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.gitsigns,

		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.commitlint,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.diagnostics.tsc,

		null_ls.builtins.completion.tags,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.tags,

		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.lua_format,

		require("typescript.extensions.null-ls.code-actions"),
	},
})

vim.cmd([[
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
]])
