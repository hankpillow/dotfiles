local ok, plugin = pcall(require, 'citruszest')
if not ok then
    print("missing citruszest")
    return
end

vim.cmd([[
try
colorscheme citruszest
echo "citruszest set"
catch
echo "failed to set citruszest theme"
colorscheme default 
endtry
]])
