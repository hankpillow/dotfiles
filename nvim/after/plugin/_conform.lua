local ok, plugin = pcall(require,"conform")
if not ok then
    print("missing stevearc/conform.nvim")
    return
end

-- https://github.com/stevearc/conform.nvim
plugin.setup({
    log_level = vim.log.levels.ALL,
    formatters_by_ft = {
        javascript = { { "prettier" } },
        typescript = { { "prettier" } },
        typescriptreact = { { "prettier" } },
        html = { { "prettier" } },
        xml = { { "prettier" } },
        scss = { { "prettier", "stylelint" } },
        css = { { "prettier", "stylelint" } },
    },
    notify_on_error = true,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set({ "n", "v" }, "<A-F>", function()
    plugin.format({ async = true, lsp_fallback = true, quiet = false })
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- local formatters = plugin.list_formatters(bufnr)
    -- print(vim.inspect(formatters))
    -- print(formatters.name .. "--" .. formatters["name"])
    -- print(type(formatters))
    -- if formatters.name then
    --     print("Formatting with " .. formatters.name)
    --     -- plugin.format({ async = true, lsp_fallback = true, quiet = false })
    -- else 
    --     print("Formatting with vim defaults")
    --     -- vim.cmd("normal! gg=G")
    -- end
end, { noremap = true, silent = false })

