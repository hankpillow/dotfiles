local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'
    -- themes
    use 'rose-pine/neovim' -- https://github.com/rose-pine/neovim
    use 'sonph/onehalf' -- https://github.com/sonph/onehalf/tree/master/vim
    use 'chriskempson/base16-vim' -- https://github.com/chriskempson/base16-vim
    use 'jnurmine/Zenburn' -- https://github.com/jnurmine/Zenburn
    use 'sjl/badwolf' -- https://github.com/sjl/badwolf/
    use 'morhetz/gruvbox' -- https://github.com/morhetz/gruvbox
    use 'folke/tokyonight.nvim'
    use 'arcticicestudio/nord-vim'
    use 'NLKNguyen/papercolor-theme' -- https://github.com/NLKNguyen/papercolor-theme
    use 'nvim-tree/nvim-web-devicons' -- https://github.com/nvim-tree/nvim-web-devicons
    ----
    use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ 
                with_sync = true
            })
            ts_update()
        end,
    } -- https://github.com/nvim-treesitter/nvim-treesitter
    use 'moll/vim-bbye' --- manage closing buffers properly https://github.com/moll/vim-bbye
    use 'tpope/vim-surround' --- https://github.com/tpope/vim-surround
    use 'tpope/vim-unimpaired' --- https://github.com/tpope/vim-unimpaired
    use 'tpope/vim-fugitive' -- git bridge: https://github.com/tpope/vim-fugitive
    use 'tpope/vim-commentary' --- https://github.com/tpope/vim-commentary
    use 'mbbill/undotree' -- https://github.com/mbbill/undotree
    use 'folke/trouble.nvim' -- https://github.com/folke/trouble.nvim
    -- use 'nvim-tree/nvim-tree.lua' -- file explorer https://github.com/nvim-tree/nvim-tree.lua
    use 'nvim-lualine/lualine.nvim' -- https://github.com/nvim-lualine/lualine.nvim
    use { 'sindrets/diffview.nvim' } -- https://github.com/sindrets/diffview.nvim
    use { 'junegunn/fzf', run = './install --bin', }
    use { 'ibhagwan/fzf-lua' } -- https://github.com/ibhagwan/fzf-lua#installation
    --use {
    --    'VonHeikemen/lsp-zero.nvim',
    --    branch = 'v1.x',
    --    requires = {
    --        -- LSP Support
    --        { 'neovim/nvim-lspconfig' },
    --        { 'williamboman/mason.nvim' },
    --        { 'williamboman/mason-lspconfig.nvim' },

    --        -- Autocompletion
    --        { 'hrsh7th/nvim-cmp' },
    --        { 'hrsh7th/cmp-buffer' },
    --        { 'hrsh7th/cmp-path' },
    --        { 'saadparwaiz1/cmp_luasnip' },
    --        { 'hrsh7th/cmp-nvim-lsp' },
    --        { 'hrsh7th/cmp-nvim-lua' },

    --        -- Snippets
    --        { 'L3MON4D3/LuaSnip' },
    --        { 'rafamadriz/friendly-snippets' },
    --    }
    -- }
end)
