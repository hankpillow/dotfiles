local lsp = require("lsp-zero")

lsp.preset("recommended")

vim.opt.signcolumn = "yes"

lsp.ensure_installed({
    'tsserver',
    'sumneko_lua',
    'angularls',
    'bashls',
    'stylelint_lsp',
    'eslint',
})

lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

lsp.configure("stylelint_lsp", {
    filetypes = { "css", "scss", "sass", "less" },
})

lsp.configure("eslint", {
    filetypes = { "json", "js", "jsx", "ts", "tsx", "html", "xml" }
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
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<A-F>', function()
        print("format buffer...")
        vim.lsp.buf.format({ async = true })
    end
    ) -- format document
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
})
