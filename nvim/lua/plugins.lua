vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
	-- Themes
	use 'folke/tokyonight.nvim'

	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'sheerun/vim-polyglot'

	-- Use dependency and run lua function after load
	-- https://github.com/lewis6991/gitsigns.nvim
	use 'lewis6991/gitsigns.nvim'

	use 'tpope/vim-commentary' 
	--- --- https://github.com/tpope/vim-commentary
	use 'tpope/vim-fugitive' 
	--- ---  https://github.com/tpope/vim-fugitive
	use 'tpope/vim-surround' 
	--- --- https://github.com/tpope/vim-surround
	use 'tpope/vim-abolish' 
	--- --- https://github.com/tpope/tpope-vim-abolish
	use 'tpope/vim-unimpaired' 
	--- --- https://github.com/tpope/vim-unimpaired
end)
