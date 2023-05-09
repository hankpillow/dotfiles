if vim.fn.exists(':Git') == 0 then
    print('missing fugitive')
    return
end

vim.cmd([[
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
nnoremap <leader>git :0G<CR>
nnoremap <leader>gps :! git push<CR>
nnoremap <leader>gpl :! git pull<CR>
]])
