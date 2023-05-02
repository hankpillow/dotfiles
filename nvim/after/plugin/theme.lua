-- local ok, plugin = pcall(require, 'rose-pine')

-- if ok then
--     print("missing rose-pine")
--     return
--     plugin.setup {
--         disable_italics = true
--     }
-- end

vim.cmd([[
set colorcolumn=100
set showbreak=↪\
set listchars=tab:»·,extends:›,precedes:‹,nbsp:•,trail:•,eol:$ 
set number 
set relativenumber 
set cursorline 
set termguicolors 
colorscheme PaperColor
set background=dark
]])
