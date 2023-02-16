local ok, plugin = pcall(require, 'nvim-tree')
if not ok then
    print("missing nvim-tree")
    return
end

plugin.setup({
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "node_modules" },
    },
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false
            }
        }
    }
})

vim.keymap.set({ 'x', 'n' }, '<C-b>', [[:NvimTreeToggle<CR>]], {})
