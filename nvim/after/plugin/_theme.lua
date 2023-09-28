vim.cmd([[
try
colorscheme gruvbox
highlight ColorColumn ctermbg=0 guibg=black
catch
echo "failed to set badwolf theme"
colorscheme default 
endtry
]])
