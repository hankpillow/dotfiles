local ok, plugin = pcall(require, 'trouble')
if not ok then
    print("missing trouble")
    return
end

plugin.setup({
    mode = "document_diagnostics"
})

-- vim.keymap.set('n', '<leader>tw', [[<cmd>TroubleToggle workspace_diagnostics<cr>]], {})
vim.keymap.set('n', '<leader>tt', [[<cmd>TroubleToggle document_diagnostics<cr>]], {})
