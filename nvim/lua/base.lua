vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true -- show current line number
vim.opt.relativenumber = true -- show relative numbers to current line
vim.opt.splitright = true -- default split is right
vim.opt.hidden = true -- allow switching from changed buffers
vim.opt.wrap = false
vim.nobackup = true
vim.noswapfile = true
vim.nowritebackup = true
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.wildignore = {
    "*.aux",
    "*.lof",
    "*.lot",
    "*.fls",
    "*.out",
    "*.toc",
    "*.fmt",
    "*.fot",
    "*.cb",
    "*.cb2",
    ".*.lb",
    "__latex*",
    "*.fdb_latexmk",
    "*.synctex",
    "*.synctex(busy)",
    "*.synctex.gz",
    "*.synctex.gz(busy)",
    "*.pdfsync",
    "*.bbl",
    "*.bcf",
    "*.blg",
    "*.run.xml",
    "indent.log",
    "*.pdf",
}

-- Global
vim.g.python3_host_prog = vim.fn.expand("/usr/bin/python3")
vim.g.netrw_browsex_viewer= "xdg-open"

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
