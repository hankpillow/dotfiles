-- Enable `lukas-reineke/indent-blankline.nvim`
-- `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

require("nvim-web-devicons").setup {
  color_icons = true;
  default = true;
}

require("rose-pine").setup {
  disable_italics = true
}

vim.cmd([[
set background=dark
colorscheme rose-pine 
set showbreak=↪\
set listchars=tab:▶\ ,extends:›,precedes:‹,nbsp:•,trail:•,eol:$
]])

vim.keymap.set('n', '<leader>gs', ':Git<CR>') -- open vim fugitive
