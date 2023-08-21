local ok, plugin = pcall(require, 'citruszest')
if not ok then
    print("missing citruszest")
    return
end

vim.cmd([[
try
colorscheme citruszest
highlight ColorColumn ctermbg=0 guibg=black
catch
echo "failed to set citruszest theme"
colorscheme default 
endtry
]])
