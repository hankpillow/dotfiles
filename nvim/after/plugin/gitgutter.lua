if vim.fn.exists(':Git') == 0 then
    print('missing gitgutter')
    return
end

vim.keymap.set('n', '<leader>tgg', [[<cmd>GitGutterToggle<cr>]], {})
