vim.cmd([[
try
colorscheme noctishc
highlight ColorColumn ctermbg=0 guibg=black
catch
echo "failed to set badwolf theme"
colorscheme default 
endtry
]])
