local ok, plugin = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print("missing nvim-treesitter.configs")
    return
end

-- https://github.com/nvim-treesitter/nvim-treesitter
plugin.setup {
    ensure_installed = {
        "bash",
        "css",
        "fish",
        "gitignore",
        "html",
        "javascript",
        "help",
        "json",
        "lua",
        "typescript",
        "vim",
        "yaml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
}

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable 
]])
