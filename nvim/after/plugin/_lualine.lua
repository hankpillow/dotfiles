-- https://github.com/nvim-lualine/lualine.nvim
local ok, plugin = pcall(require, 'lualine')

if not ok then
    print("missing lualine")
    return
end

plugin.setup {
    options = {
        icons_enabled = true,
        theme = "rose-pine",
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'filename', path = 1}},
        lualine_c = {'branch'},
        lualine_x = {},
        lualine_y = {'location'},
        lualine_z = {'encoding', { 'filetype', icons_enabled = false } }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

