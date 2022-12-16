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

	-- use 'mhinz/vim-grepper'--- https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt 
	-- use 'tpope/vim-fugitive'-- https://github.com/tpope/vim-fugitive 
	use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim
	use 'sheerun/vim-polyglot'
	use 'moll/vim-bbye'--- manage closing buffers properly https://github.com/moll/vim-bbye 
	use 'gcmt/wildfire.vim'--- https://github.com/gcmt/wildfire.vim/blob/master/README.md - select objects
	use 'tpope/vim-commentary'--- https://github.com/tpope/vim-commentary 
	use 'tpope/vim-surround'--- https://github.com/tpope/vim-surround 
	use 'tpope/vim-abolish'--- https://github.com/tpope/tpope-vim-abolish 
	use 'tpope/vim-unimpaired'--- https://github.com/tpope/vim-unimpaired 
	use 'matze/vim-move'--- https://github.com/matze/vim-move
	-- use 'junegunn/fzf.vim' 
	use 'nvim-tree/nvim-tree.lua' 
	use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim
	-- use 'neovim/nvim-lspconfig' 
	-- use 'kabouzeid/nvim-lspinstall'
	use 'jose-elias-alvarez/null-ls.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- use { 'junegunn/fzf', run = ":call fzf#install()" } -- https://github.com/junegunn/fzf.vim
	-- telescopet
end)
