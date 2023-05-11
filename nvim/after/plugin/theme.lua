-- local ok, plugin = pcall(require, 'rose-pine')

-- if ok then
--     print("missing rose-pine")
--     return
--     plugin.setup {
--         disable_italics = true
--     }
-- end

-- let g:PaperColor_Theme_Options = {
-- \   'theme': {
-- \     'default': {
-- \       'allow_bold' : 0,
-- \       'allow_italic' : 0,
-- \     },
-- \     'default.dark': {
-- \       'allow_bold' : 0,
-- \       'allow_italic' : 0,
-- \     }
-- \   }
-- \ }
-- colorscheme PaperColor

vim.cmd([[
try
colorscheme base16-chalk
catch
colorscheme default 
endtry

""" change color for folded lines
highlight! link Folded Normal
highlight Folded ctermbg=NONE guibg=NONE ctermfg=white guifg=white
]])
