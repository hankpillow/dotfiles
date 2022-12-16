-- https://github.com/nvim-tree/nvim-tree.lua#setup
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
		renderer = {
			icons = {
				show = {
					file = false,
					folder = false,
					folder_arrow = false,
					git = true
				}
			}
		}
	}	
	)

require('gitsigns').setup()

-- https://github.com/nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		"bash",
		"css",
		"fish",
		"gitignore",
		"html",
		"javascript",
		"json",
		"lua",
		"typescript",
		"vim",
		"yaml"
	},
	-- sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
	-- -- ignore_install = { "javascript" } -- List of parsers to ignore installing (for "all")
	auto_install = true,-- Automatically install missing parsers when entering buffer
	highlight = {
		enable = true, -- `false` will disable the whole extension
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		-- keymaps = {
		-- 	init_selection = "gnn",
		-- 	node_incremental = "grn",
		-- 	scope_incremental = "grc",
		-- 	node_decremental = "grm",
		-- },
	},
}

-- local nvim_lsp = require('lspconfig')

-- local lspi = require('lspinstall') 
-- local function setup_servers()
-- 	lspi.setup()
-- 	local servers = lspi.installed_servers()
-- 	-- lspi.install_server("javascript")
-- 	-- table.insert(servers,"javascript")
-- 	-- table.insert(servers,"typescript")
-- 	-- table.insert(servers,"tailwind")
-- 	-- table.insert(servers,"vim")
-- 	-- table.insert(servers,"lua")
-- 	-- table.insert(servers,"json")
-- 	-- table.insert(servers,"html")
-- 	-- table.insert(servers,"angular")
-- 	-- table.insert(servers,"bash")
-- 	-- table.insert(servers,"yaml")
-- 	for _, server in pairs(servers) do
-- 		-- print('setup server', server)
-- 		require('lspconfig')[server].setup{}
-- 	end
-- end

-- setup_servers()

-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- lspi.post_install_hook = function()
-- 	setup_servers() -- reload installed servers
-- 	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

local null_ls = require("null-ls")
null_ls.setup({
		debug = true,
		sources = {
			null_ls.builtins.code_actions.eslint_d,
			null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.diagnostics.jsonlint,
			null_ls.builtins.diagnostics.commitlint,
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.fish,
			null_ls.builtins.completion.tags,
			null_ls.builtins.formatting.prettier
		},
	})

