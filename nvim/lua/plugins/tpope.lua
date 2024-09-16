return {
    -- "tpope/vim-commentary", -- https://github.com/tpope/vim-commentary
    "tpope/vim-surround", -- https://github.com/tpope/vim-surround
    "tpope/vim-unimpaired", -- https://github.com/tpope/vim-unimpaired
    {
        "tpope/vim-fugitive", -- https://github.com/tpope/vim-fugitive
        config = function()
            vim.cmd([[
            nnoremap <leader>gs :G<CR>
            nnoremap <leader>gw :Gwrite<CR>
            ]])
        end,
    },
}
