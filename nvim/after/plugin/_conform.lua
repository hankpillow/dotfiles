local ok, plugin = pcall(require,"conform")
if not ok then
    print("missing stevearc/conform.nvim")
    return
end

-- https://github.com/stevearc/conform.nvim
plugin.setup({
    formatters_by_ft = {
        javascript = { { "prettier" } },
        typescript = { { "prettier" } },
        typescriptreact = { { "prettier" } },
        html = { { "prettier" } },
        xml = { { "prettier" } },
        scss = { { "stylelint" } },
    },
    notify_on_error = true
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set("n", "<A-F>", function()
    plugin.format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = false })

