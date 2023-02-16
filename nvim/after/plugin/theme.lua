local ok, plugin = pcall(require, 'rose-pine')
if not ok then
    print("missing rose-pine")
    return
end

plugin.setup {
    disable_italics = true
}

vim.cmd([[
colorscheme rose-pine 
set colorcolumn=100
set showbreak=↪\
set listchars=tab:»·,extends:›,precedes:‹,nbsp:•,trail:•,eol:$ 
set background=dark
set number 
set relativenumber 
set cursorline 
set termguicolors 
]])
