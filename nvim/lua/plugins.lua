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

	use { "wbthomason/packer.nvim" }

	use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim
	use 'sheerun/vim-polyglot'
	use 'moll/vim-bbye'--- manage closing buffers properly https://github.com/moll/vim-bbye 
	use 'gcmt/wildfire.vim'--- https://github.com/gcmt/wildfire.vim/blob/master/README.md - select objects
	use 'tpope/vim-commentary'--- https://github.com/tpope/vim-commentary 
	use 'tpope/vim-surround'--- https://github.com/tpope/vim-surround 
	use 'tpope/vim-abolish'--- https://github.com/tpope/tpope-vim-abolish 
	use 'tpope/vim-unimpaired'--- https://github.com/tpope/vim-unimpaired 
	use 'matze/vim-move'--- https://github.com/matze/vim-move
	use 'nvim-tree/nvim-tree.lua' 
	use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/typescript.nvim'
	use 'nvim-telescope/telescope.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use 'tpope/vim-fugitive'-- https://github.com/tpope/vim-fugitive 
end)
