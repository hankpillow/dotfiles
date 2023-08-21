-- https://github.com/ibhagwan/fzf-lua
local ok, plugin = pcall(require, 'fzf-lua')

if not ok then
    print("missing fzf-lua")
    return
end

plugin.setup({'fzf-native'})

local opts = { noremap = true, silent = true }
local nopreview = { preview_opts = "hidden" }

vim.keymap.set("n", "<C-k>", function()
    plugin.builtin()
end, opts)

vim.keymap.set("n", "<A-k>", function()
    plugin.commands()
end, opts)

vim.keymap.set("n", "<C-p>", function()
    plugin.git_files()
end, opts)

vim.keymap.set("n", "<A-p>", function()
    plugin.files(nopreview)
end, opts)

vim.keymap.set("n", "<space><space>", function()
    plugin.buffers()
end, opts)

vim.keymap.set("n", "<space>?", function()
    plugin.oldfiles(nopreview)
end, opts)

vim.keymap.set("n", "<C-g>", plugin.live_grep_glob, opts)
vim.keymap.set("v", "<C-g>", plugin.grep_visual, opts)
vim.keymap.set("v", "<leader>gw", plugin.grep_cWORD, opts)
