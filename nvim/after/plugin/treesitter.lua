local ok, plugin = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print("missing nvim-treesitter")
    return
end
local cok, context = pcall(require, 'treesitter-context')
if not cok then
    print("missing treesitter-context")
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

context.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    -- multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}
