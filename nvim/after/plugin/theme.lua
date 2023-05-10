-- local ok, plugin = pcall(require, 'rose-pine')

-- if ok then
--     print("missing rose-pine")
--     return
--     plugin.setup {
--         disable_italics = true
--     }
-- end

vim.cmd([[
try
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
\   'theme': {
\     'default.dark': {
\       'allow_bold' : 0,
\       'allow_italic' : 0,
\     }
\   }
\ }
catch
echo "PaperColor is not available"
colorscheme default 
endtry
""" change color for folded lines
highlight! link Folded Normal
highlight Folded ctermbg=NONE guibg=NONE ctermfg=white guifg=white
]])
