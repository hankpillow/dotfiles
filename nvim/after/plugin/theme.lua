vim.cmd([[
try
colorscheme citruszest
catch
echo "failed to use custom colorscheme"
colorscheme default 
endtry

""" change color for folded lines
""" highlight! link Folded Normal
""" highlight Folded ctermbg=NONE guibg=NONE ctermfg=white guifg=white
]])
