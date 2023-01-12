local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)

	-- common dependencies
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim

	-- themes
	use 'sonph/onehalf' -- https://github.com/sonph/onehalf/tree/master/vim
	use 'chriskempson/base16-vim' -- https://github.com/chriskempson/base16-vim
	use 'jnurmine/Zenburn' -- https://github.com/jnurmine/Zenburn
	use 'sjl/badwolf' -- https://github.com/sjl/badwolf/
	use 'rose-pine/neovim' -- https://github.com/rose-pine/neovim
	use 'morhetz/gruvbox' -- https://github.com/morhetz/gruvbox
	use 'folke/tokyonight.nvim'
	use 'arcticicestudio/nord-vim'
	use 'NLKNguyen/papercolor-theme' -- https://github.com/NLKNguyen/papercolor-theme
	use 'nvim-tree/nvim-web-devicons' -- https://github.com/nvim-tree/nvim-web-devicons

	-- settings
	use 'sheerun/vim-polyglot'
	use 'moll/vim-bbye'--- manage closing buffers properly https://github.com/moll/vim-bbye 
	-- use 'gcmt/wildfire.vim'--- https://github.com/gcmt/wildfire.vim/blob/master/README.md - select objects
	use 'tpope/vim-commentary'--- https://github.com/tpope/vim-commentary 
	use 'tpope/vim-surround'--- https://github.com/tpope/vim-surround 
	use 'tpope/vim-unimpaired'--- https://github.com/tpope/vim-unimpaired 
	use 'tpope/vim-fugitive'-- https://github.com/tpope/vim-fugitive 
	use 'matze/vim-move'--- https://github.lukas-reineke/indent-blankline.nvimcom/matze/vim-move

	-- UI

	-- Add indentation guides even on blank lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- Highlight, edit, and navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,

	}
	-- Additional text objects via treesitter
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	-- autocompelte
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'glepnir/lspsaga.nvim',
		},
	}

	-- file explorer
	use 'nvim-tree/nvim-tree.lua'  -- https://github.com/nvim-tree/nvim-tree.lua

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'j-hui/fidget.nvim',
		},
	}

	-- display lsp diagnostic
	use 'folke/trouble.nvim' -- https://github.com/folke/trouble.nvim

	-- Git decorations
	use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim

	-- Fancier statusline
	use 'nvim-lualine/lualine.nvim'

	-- Fuzzy Finder (files, lsp, etc)
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { 
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim'
		}
	}

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
		cond = vim.fn.executable 'make' == 1
	}

	use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

	if is_bootstrap then
		require('packer').sync()
	end

end)
