-----------------------nvim-tree
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

-----------------------gitsigns
require('gitsigns').setup()

-----------------------treesitter
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
		"vim",
		"yaml"
	},
	auto_install = true,
	highlight = {
		    additional_vim_regex_highlighting = false,
		enable = true
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true
	},
}
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable 
]])


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
		},
	})

vim.cmd([[
nnoremap <A-F> :lua vim.lsp.buf.format()<cr> 
nnoremap <C-SPACE> :lua vim.diagnostic.open_float()<CR>

"" next/prev error
nnoremap ]e :lua vim.diagnostic.goto_next()<CR>
nnoremap [e :lua vim.diagnostic.goto_prev()<CR>
"" imap <silent> <c-space> :lua vim.lsp.omnifunc()<CR>
]])

-----------------------telescope
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
-- require('telescope').setup {
--   extensions = {
--     -- fzf = {
--     --   fuzzy = true,                    -- false will only do exact matching
--     --   override_generic_sorter = true,  -- override the generic sorter
--     --   override_file_sorter = true,     -- override the file sorter
--     --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--     --                                    -- the default case_mode is "smart_case"
--     -- }
--   }
-- }

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').setup()

vim.cmd([[
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
]])
--
-----------------------vim-fugitive
vim.cmd([[
nnoremap <leader>gs <cmd>Git<cr>
]])
