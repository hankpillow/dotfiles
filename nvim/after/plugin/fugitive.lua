vim.cmd([[
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%y\ %(%l,%c%)\ %k%q
]])

local keymap = vim.keymap
local e_opts = { noremap = true, expr = true }
local s_opts = { noremap = true, silent = true }
local se_opts = { noremap = true, silent = true, expr = true }

-- Exit
keymap.set('n', '<leader>g', ':0G', e_opts) -- quit
