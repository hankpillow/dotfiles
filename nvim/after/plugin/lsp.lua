local iok, lsp = pcall(require, 'lsp-zero')
local lok, lspconfig = pcall(require, 'lspconfig')

if not iok then
    print("missing lsp-zero")
    return
end

if not lok then
    print("missing lspconfig")
    return
end

lsp.preset("recommended")


lsp.ensure_installed({
    'tsserver',
    'angularls',
    'bashls',
    'stylelint_lsp',
    'eslint',
})

lsp.configure('tsserver', {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json" },
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false,
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4"
                }
            }
        }
    }
})

lsp.configure("stylelint_lsp", {
    filetypes = { "css", "scss", "sass", "less" },
})

lsp.configure("eslint", {
    filetypes = { "json", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
})

lsp.configure("angularls", {
    autostart = false
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<A-H>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<A-F>', function()
        print("format buffer...")
        vim.cmd [[LspZeroFormat]]
    end
    )
end)

vim.opt.signcolumn = "yes"
vim.diagnostic.config({
    virtual_text = false,
})

lsp.nvim_workspace()
lsp.setup()
