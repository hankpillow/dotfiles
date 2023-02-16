local ok, plugin = pcall(require, 'telescope')
if not ok then
    print("missing telescope")
    return
end

plugin.setup({
    file_ignore_patterns = {
        "node_modules",
        ".cache",
        "dist",
        "public"
    }
})

-- Enable telescope fzf native, if installed
pcall(plugin.load_extension, "fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", function()
    builtin.git_files({ previewer = false })
end, {})

vim.keymap.set("n", "<A-p>", function()
    builtin.find_files({ previewer = false })
end, {})

vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<space><space>", builtin.buffers, {})
vim.keymap.set("n", "<space>?", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>br", builtin.git_branches, {})
