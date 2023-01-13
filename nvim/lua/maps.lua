local keymap = vim.keymap
local e_opts = {noremap = true, expr = true}
local s_opts = {noremap = true, silent = true}
local se_opts = {noremap = true, silent = true, expr = true}

-- Exit
keymap.set('n', '<leader>q', ':q<CR>') -- quit
keymap.set('n', '<leader>Q', ':qa!<CR>') -- quit without saving
keymap.set('n', '<leader>w', ':w<CR>') -- write
keymap.set('n', '<leader>wq', ':wq<CR>') -- write

---- utils
keymap.set('n', '<F5>', ':source ~/.config/nvim/init.lua<CR>') -- reload nvim config
keymap.set('n', '<leader>cd', ':lcd %:p:h<CR>') -- change current work dir to current file

---- insert
-- keymap.set('i', '<C-BS>', '<C-w>') -- Delete previous word
keymap.set('i', '<C-Del>', '<C-o>dW') -- Delete next word

---- Move
keymap.set('n', ']j', 'g,') -- prev jump list
keymap.set('n', '[j', 'g;') -- next jump list
keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', e_opts)
keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', e_opts)
keymap.set('n', 'E', 'g_') -- end of line
keymap.set('v', 'E', 'g_') -- end of line
keymap.set('n', 'B', '^') -- start of line
keymap.set('v', 'B', '^') -- start of line

---- Center cursor after traversing search
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

---- Toggle fold (single level)
keymap.set('n', '<Space>', 'foldlevel(".") ? "za" : "<Space>"')

---- toggles
keymap.set('n', '<leader>ts', '<cmd>setlocal spell!<CR>')
keymap.set('n', '<leader>tl', ':set list!<CR>') -- show invisible
keymap.set('n', '<leader>tw', ':set wrap!<CR>') -- wrap/unwrap lines
keymap.set('n', '<leader>tp', '<F12>\'+P<F12>') -- toggle paste mode and paste from system clipboard

---- Paste from system clipboard in insert/select mode
keymap.set('i', '<C-v>', '<C-R>+')
keymap.set('s', '<C-v>', '<BS>i<C-R>+')

---- Copy/yank
-- yank and move to last position '> on visual
keymap.set('n', 'Y', 'yy') -- yank entire line
keymap.set('x', 'Y', 'yy') -- yank entire line
keymap.set('n', 'yc', '\'+y') -- Always yank to clipboard
keymap.set('x', 'yc', '\'+y') -- Always yank to clipboard
keymap.set('n', '<C-p>', '"0p') -- paste from 0
keymap.set('x', '<C-p>', '"0p') -- paste from 0

---- Duplicate
keymap.set('n', '<A-K>', 'yyP')
keymap.set('n', '<A-J>', 'yyp')
keymap.set('x', '<A-K>', 'y :normal P<cr>')
keymap.set('x', '<A-J>', 'y :normal \'>p<cr>')

---- Fix accidental line joining during visual block selection
keymap.set('v', 'J', 'j')
keymap.set('v', 'K', 'k')

---- Indenting/Formatting
keymap.set('n', '<A-F>', 'gg=G\'\'zz<Esc>') -- format document
keymap.set('n', '<M-]>', '>>')
keymap.set('n', '<M-[>', '<<')

---- Buffer
keymap.set('n', '<leader>d', ':Bdelete<CR>') -- delete buffer
keymap.set('n', '<leader>D', ':bufdo :Bdelete<CR>') -- delete all buffers
keymap.set('n', '[b', ':bprev<CR>') -- prev buffer
keymap.set('n', ']b', ':bnext<CR>') -- next buffer

keymap.set('n', '[z', 'zk') -- perv fold 
keymap.set('n', ']z', 'zj') -- next fold

---- Find & Replace
keymap.set('n', '<leader>r', ':%s///gc<left><left><left>')
keymap.set('x', '<leader>r', ':%s///gc<left><left><left>') -- visual and vblock
-- keymap.set('v', '//', 'y/<C-R>\'<CR>') -- copy selection on visual mode and start searching
keymap.set('n', '*', '*N') -- select current work and don't move to next match 
keymap.set('x', '<F2>', 'y<ESC>/<C-r>"<CR>N') 
-- keymap.set('n', '<F2>', 'yviw*N:%s///g<left><left>')
