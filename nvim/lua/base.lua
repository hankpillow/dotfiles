local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    group = augroup('HighlightYank', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.splitright = true -- default split is right
vim.opt.hidden = true -- allow switching from changed buffers

vim.opt.wrap = false -- dont wrap text by default

-- vim.nobackup = true
-- vim.noswapfile = true
-- vim.nowritebackup = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.wildignore = {
    "*.pdf",
    "*.jpeg",
    "*.jpg",
    "*.gif",
    "*.png",
    "*.tiff",
    "*.webp",
    "**/node_modules/**"
}

-- Global
vim.g.python3_host_prog = vim.fn.expand("/usr/bin/python3")
vim.g.netrw_browsex_viewer= "xdg-open"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
