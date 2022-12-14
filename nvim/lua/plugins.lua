vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
	-- Theme
	use 'folke/tokyonight.nvim'
	use 'arcticicestudio/nord-vim'

	use 'sheerun/vim-polyglot'
	use 'moll/vim-bbye'--- manage closing buffers properly https://github.com/moll/vim-bbye 
	use 'gcmt/wildfire.vim'--- https://github.com/gcmt/wildfire.vim/blob/master/README.md - select objects
	use 'mhinz/vim-grepper'--- https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt 
	use 'tpope/vim-commentary'--- https://github.com/tpope/vim-commentary 
	use 'tpope/vim-fugitive'---  https://github.com/tpope/vim-fugitive 
	use 'tpope/vim-surround'--- https://github.com/tpope/vim-surround 
	use 'tpope/vim-abolish'--- https://github.com/tpope/tpope-vim-abolish 
	use 'tpope/vim-unimpaired'--- https://github.com/tpope/vim-unimpaired 
	use 'matze/vim-move'--- https://github.com/matze/vim-move
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'junegunn/fzf', run = ":call fzf#install()" } -- https://github.com/junegunn/fzf.vim
	use { 'junegunn/fzf.vim' }
	use 'nvim-tree/nvim-web-devicons'
	use { 
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("nvim-tree").setup()
		end
	}
	-- Use dependency and run lua function after load
	-- https://github.com/lewis6991/gitsigns.nvim
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	use 'neovim/nvim-lspconfig' 
	use 'jose-elias-alvarez/null-ls.nvim'

end)
