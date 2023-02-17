local ok, plugin = pcall(require, 'fzf-lua')
if not ok then
    print("missing fzf-lua")
    return
end

-- https://github.com/ibhagwan/fzf-lua

local opts = { noremap = true, silent = true }
local nopreview = { preview_opts = "hidden" }

-- commands
vim.keymap.set("n", "<C-C>", function()
    plugin.builtin()
end, opts)
vim.keymap.set("n", "<C-p>", function()
    plugin.git_files(nopreview)
end, opts)
vim.keymap.set("n", "<A-p>", function()
    plugin.files(nopreview)
end, opts)
vim.keymap.set("n", "<space><space>", function()
    plugin.buffers(nopreview)
end, opts)
vim.keymap.set("n", "<space>?", function()
    plugin.oldfiles(nopreview)
end, opts)

-- search
vim.keymap.set("n", "<C-g>", plugin.grep, opts)
vim.keymap.set("n", "<C-G>", plugin.grep_cword, opts)
