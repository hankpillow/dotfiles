-- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-----------------------------------------------------------------------------------------
-- THEME
-----------------------------------------------------------------------------------------

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
