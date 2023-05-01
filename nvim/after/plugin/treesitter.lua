local ok, plugin = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print("missing nvim-treesitter")
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
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
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

-- vim.cmd([[
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- set nofoldenable 
-- ]])
