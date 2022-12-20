vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require("packer").startup(function(use)
	-- common dependencies
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim" -- https://github.com/nvim-lua/plenary.nvim
	use "hrsh7th/nvim-cmp" -- Autocompletion plugin
	use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
	use "L3MON4D3/LuaSnip" -- Snippets plugin
	use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
	use "morhetz/gruvbox" -- https://github.com/morhetz/gruvbox
	use "sonph/onehalf" -- https://github.com/sonph/onehalf/tree/master/vim
	use "chriskempson/base16-vim" -- https://github.com/chriskempson/base16-vim
	use "jnurmine/Zenburn" -- https://github.com/jnurmine/Zenburn
	use "sjl/badwolf" -- https://github.com/sjl/badwolf/
	use "rose-pine/neovim" -- https://github.com/rose-pine/neovim
	-- themes
	use "folke/tokyonight.nvim"
	use "arcticicestudio/nord-vim"
	use "NLKNguyen/papercolor-theme" -- https://github.com/NLKNguyen/papercolor-theme
	use 'nvim-tree/nvim-web-devicons' -- https://github.com/nvim-tree/nvim-web-devicons
	-- settings
	use "sheerun/vim-polyglot"
	use "moll/vim-bbye"--- manage closing buffers properly https://github.com/moll/vim-bbye 
	use "gcmt/wildfire.vim"--- https://github.com/gcmt/wildfire.vim/blob/master/README.md - select objects
	use "tpope/vim-commentary"--- https://github.com/tpope/vim-commentary 
	use "tpope/vim-surround"--- https://github.com/tpope/vim-surround 
	use "tpope/vim-abolish"--- https://github.com/tpope/tpope-vim-abolish 
	use "tpope/vim-unimpaired"--- https://github.com/tpope/vim-unimpaired 
	use "tpope/vim-fugitive"-- https://github.com/tpope/vim-fugitive 
	use "matze/vim-move"--- https://github.com/matze/vim-move
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	-- UI
	-- file explorer
	use "nvim-tree/nvim-tree.lua"  -- https://github.com/nvim-tree/nvim-tree.lua
	-- LSP
	use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
	use "jose-elias-alvarez/null-ls.nvim"
	use "jose-elias-alvarez/typescript.nvim"
	use "folke/trouble.nvim" -- https://github.com/folke/trouble.nvim
	-- Git
	use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim
	use "nvim-telescope/telescope.nvim" -- https://github.com/nvim-telescope/telescope.nvim
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
end)
