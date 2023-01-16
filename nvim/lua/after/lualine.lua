-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      winbar = {'packer', 'NVimTree'},
      statuline = {'packer', 'NVimTree'}
    }
  },
  sections = {
    lualine_ = { "branch" },
    lualine_y = {}
  }
}
