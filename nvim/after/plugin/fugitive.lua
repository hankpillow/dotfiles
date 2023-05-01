local ok, plugin = pcall(require, 'fugitive')
if not ok then
    print("missing fugitive")
    return
end

vim.cmd([[
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
]])
