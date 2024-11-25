vim.g.python3_host_prog = vim.fn.expand("/usr/bin/python3") -- set Python3 interpreter path
vim.g.netrw_browsex_viewer = "xdg-open" -- set default file browser on Linux
vim.g.netrw_banner = 0 -- disable the netrw banner

vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.colorcolumn = { 100 } -- highlight the 100th column
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true -- highlight the current line
vim.opt.encoding = "utf-8" -- set encoding to UTF-8
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- set file encoding to UTF-8
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
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

-- Folding
vim.opt.foldlevel = 99
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.smoothscroll = true
vim.opt.foldexpr = "v:lua.require'me.util'.foldexpr()"
vim.opt.foldmethod = "expr"
-- vim.opt.foldtext = " "

vim.scriptencoding = "utf-8" -- set script encoding to UTF-8
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

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
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END
]])

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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
