local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function _G.MyFold()
	return "..." .. vim.fn.getline(vim.v.foldstart)
end

autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })

vim.cmd("autocmd!")

vim.g.python3_host_prog = vim.fn.expand("/usr/bin/python3") -- set Python3 interpreter path
vim.g.netrw_browsex_viewer = "xdg-open" -- set default file browser on Linux
-- vim.g.netrw_browse_split = 0 -- open file browser in a new tab instead of a split
-- vim.g.netrw_winsize = 15 -- set the file browser window size
vim.g.netrw_banner = 0 -- disable the netrw banner
vim.o.foldmethod = "indent" -- Set the foldmethod to indent
vim.o.foldlevelstart = 99 -- Set the foldlevelstart to 99
vim.opt.background = "dark" -- set dark background
vim.opt.backup = false -- disable backups
vim.opt.colorcolumn = { 100 } -- highlight the 100th column
vim.opt.cursorline = true -- highlight the current line
vim.opt.encoding = "utf-8" -- set encoding to UTF-8
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- set file encoding to UTF-8
vim.opt.fillchars:append({ fold = " " }) -- Append a space character to the fold fill character
vim.opt.foldtext = "v:lua.MyFold()" -- Set the foldtext to the MyFold function in Lua
vim.opt.hidden = true -- allow hidden buffers
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- show search results incrementally
vim.opt.number = true -- show line numbers
vim.opt.pumblend = 5 -- set popup menu blend to 50%
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.scrolloff = 8 -- set scroll offset to 8 lines
vim.opt.shiftwidth = 4 -- set shift width to 4 spaces
vim.opt.showbreak = "↪\\" -- show continuation arrow
vim.opt.smartindent = true -- enable smart indent
vim.opt.ignorecase = true -- enable ignore case
vim.opt.smartcase = true -- enable smart case
vim.opt.softtabstop = 4 -- set soft tabstop to 4 spaces
vim.opt.splitright = true -- open splits to the right
vim.opt.swapfile = false -- disable swap files
vim.opt.tabstop = 4 -- set tabstop to 4 spaces
vim.opt.termguicolors = true -- enable truecolor support
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set undo directory
vim.opt.undofile = true -- enable undo file
vim.opt.wildoptions = "pum" -- enable popup menu for file completion
vim.opt.winblend = 0 -- disable window blending
vim.opt.wrap = false -- disable line wrapping
vim.opt.listchars = { -- show non-printable characters
	tab = "»·",
	extends = "›",
	precedes = "‹",
	nbsp = "•",
	trail = "•",
	eol = "$",
}
vim.opt.wildignore = { -- ignore these files when completing
	"*.pdf",
	"*.jpeg",
	"*.jpg",
	"*.gif",
	"*.png",
	"*.tiff",
	"*.zip",
	"*.tar",
	"*.webp",
	"**/node_modules/**",
	"**/cache/**",
}
vim.scriptencoding = "utf-8" -- set script encoding to UTF-8
vim.cmd([[ 
let g:clipboard = {
\   'name': 'WslClipboard',
\   'copy': {
\      '+': 'clip.exe',
\      '*': 'clip.exe',
\    },
\   'paste': {
\      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
\      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
\   },
\   'cache_enabled': 0,
\ }
]])

vim.cmd([[
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
augroup MyAutoGroup
  autocmd!
  autocmd BufRead,BufNewFile *.mdx setlocal filetype=jsx
augroup END
augroup quickfix_group
    autocmd!
    autocmd filetype qf setlocal errorformat+=%f\|%l\ col\ %c\|%m
augroup END
]])
