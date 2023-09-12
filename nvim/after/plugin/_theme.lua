-- local ok, plugin = pcall(require, 'badwolf')
-- if not ok then
--     print("missing badwolf")
--     return
-- end

vim.cmd([[
try
colorscheme rose-pine
highlight ColorColumn ctermbg=0 guibg=black
catch
echo "failed to set badwolf theme"
colorscheme default 
endtry
]])
