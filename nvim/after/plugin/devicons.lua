local ok, plugin = pcall(require, 'nvim-web-devicons')
if not ok then
    print("missing nvim-web-devicons")
    return
end

plugin.setup {
    color_icons = true;
    default = true;
}
