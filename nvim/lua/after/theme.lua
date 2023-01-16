vim.o.background = "dark"
vim.opt.number = true -- show current line number
vim.opt.relativenumber = true -- show relative numbers to current line
vim.opt.listchars = "tab:▶ ,extends:›,precedes:‹,nbsp:•,trail:•,eol:$" -- define how to display invisible shar when list is active
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Enable `lukas-reineke/indent-blankline.nvim`
-- `:help indent_blankline.txt`
-- require('indent_blankline').setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
-- }

require("nvim-web-devicons").setup {
  color_icons = true;
  default = true;
}

require("rose-pine").setup {
  disable_italics = true
}

vim.cmd([[
colorscheme rose-pine 
set showbreak=↪\
]])

