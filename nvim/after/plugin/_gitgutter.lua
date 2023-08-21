if vim.fn.exists(':Git') == 0 then
    print('missing gitgutter')
    return
end

vim.keymap.set('n', '<leader>tgg', vim.cmd.GitGutterToggle, {})
vim.keymap.set('n', ']h', vim.cmd.GitGutterNextHunk, { desc = "Prev git change"})
vim.keymap.set('n', '[h', vim.cmd.GitGutterPrevHunk, { desc = "Next git change"})
vim.keymap.set('n', '<leader>hp', vim.cmd.GitGutterPreviewHunk, { desc = "GitGutter preview diff" })
