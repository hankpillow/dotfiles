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

	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'sheerun/vim-polyglot'

	-- Use dependency and run lua function after load
	-- https://github.com/lewis6991/gitsigns.nvim
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	--- manage closing buffers properly https://github.com/moll/vim-bbye
	use 'moll/vim-bbye' 

	--- https://github.com/gcmt/wildfire.vim/blob/master/README.md
	-- With Wildfire you can quickly select the closest text object among a group of candidates. 
	use 'gcmt/wildfire.vim' 

	--- search tool using ag/rg/git etc https://github.com/mhinz/vim-grepper/blob/master/doc/grepper.txt
	use 'mhinz/vim-grepper' 

	--- https://github.com/tpope/vim-commentary
	use 'tpope/vim-commentary' 

	---  https://github.com/tpope/vim-fugitive
	use 'tpope/vim-fugitive' 

	--- https://github.com/tpope/vim-surround
	use 'tpope/vim-surround' 

	--- https://github.com/tpope/tpope-vim-abolish
	use 'tpope/vim-abolish' 

	--- https://github.com/tpope/vim-unimpaired
	use 'tpope/vim-unimpaired' 

	-- https://github.com/junegunn/fzf.vim
	use { 'junegunn/fzf', run = ":call fzf#install()" }
	use { 'junegunn/fzf.vim' }
end)
