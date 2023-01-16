require("rose-pine").setup {
    disable_italics = true
}

vim.cmd([[
colorscheme rose-pine 
set showbreak=↪\
set listchars=tab:»·,extends:›,precedes:‹,nbsp:•,trail:•,eol:$ 
set background=dark
set number 
set relativenumber 
set cursorline 
set termguicolors 
]])
