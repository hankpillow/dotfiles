if not vim.fn.has('fugitive') then
    print('missing fugitive')
    return
end

vim.cmd([[
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
]])
