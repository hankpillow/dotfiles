local keymap = vim.keymap
local e_opts = { noremap = true, expr = true }
local s_opts = { noremap = true, silent = true }
local se_opts = { noremap = true, silent = true, expr = true }

-- Exit
keymap.set('n', '<leader>q', ':q!<CR>') -- quit
keymap.set('n', '<leader>Q', ':qa!<CR>') -- quit without saving
keymap.set('n', '<leader>w', ':w<CR>') -- write
keymap.set('n', '<leader>wq', ':wq<CR>') -- write
keymap.set('n', '<leader>wqa', ':wqa!<CR>') -- write
keymap.set("n", "-", vim.cmd.Ex)

---- utils
keymap.set('n', '<F5>', ':source ~/.config/nvim/init.lua<CR>') -- reload nvim config
keymap.set('n', '<leader>cd', ':lcd %:p:h<CR>') -- change current work dir to current file

---- insert
keymap.set('i', '<C-Del>', '<C-o>dW') -- Delete next word

---- Move
keymap.set({ 'n', 'x' }, ']j', 'g,') -- prev jump list
keymap.set({ 'n', 'x' }, '[j', 'g;') -- next jump list
keymap.set('n', ']v', '\'>') -- jump to end of visual selection
keymap.set('n', '[v', '\'<') -- jump to start of visual selection
keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', e_opts)
keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', e_opts)
keymap.set({ 'n', 'x' }, 'E', 'g_') -- end of line
keymap.set({ 'n', 'x' }, 'B', '^') -- start of line

-- Editing
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down
keymap.set("n", "J", "mzJ`z") -- keep the cursor while joining lines

---- Center cursor after traversing search
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

---- toggles
keymap.set('n', '<leader>ts', '<cmd>setlocal spell!<CR>')
keymap.set('n', '<leader>tl', ':set list!<CR>') -- show invisible
keymap.set('n', '<leader>tw', ':set wrap!<CR>') -- wrap/unwrap lines
keymap.set('n', '<leader>tp', '<F12>\'+P<F12>') -- toggle paste mode and paste from system clipboard

---- Paste from system clipboard in insert/select mode
keymap.set('i', '<C-v>', '<C-R>+')
keymap.set('s', '<C-v>', '<BS>i<C-R>+')

-- yank/copy
keymap.set({ 'n', 'x' }, 'Y', 'yy') -- yank entire line
keymap.set({ 'n', 'x' }, '<C-p>', '"0p') -- paste from 0
keymap.set({ 's', 'v' }, "<leader>y", [["+y]]) -- yank to clipboard
keymap.set('n', "<leader>Y", [["+Y]]) -- yank line to clipboard

---- Duplicate
keymap.set('n', '<A-K>', 'yyP')
keymap.set('n', '<A-J>', 'yyp')
keymap.set('x', '<A-K>', 'y :normal P<cr>')
keymap.set('x', '<A-J>', 'y :normal \'>p<cr>')

---- Fix accidental line joining during visual block selection
keymap.set('v', 'J', 'j')
keymap.set('v', 'K', 'k')

---- Indenting/Formatting
keymap.set('n', '<A-F>', function()
    print("format buffer...")
    vim.lsp.buf.format()
end
) -- format document
keymap.set('n', '<M-]>', '>>')
keymap.set('n', '<M-[>', '<<')

---- Buffer
keymap.set('n', '<leader>d', ':Bdelete<CR>') -- delete buffer
keymap.set('n', '<leader>D', ':bufdo :Bdelete<CR>') -- delete all buffers
keymap.set('n', '[b', ':bprev<CR>') -- prev buffer
keymap.set('n', ']b', ':bnext<CR>') -- next buffer

---- Find & Replace
keymap.set('n', '<leader>r', ':%s///gc<left><left><left>')
keymap.set('n', '*', '*Nzz') -- select current work and don't move to next match
keymap.set('x', '<F2>', 'y<ESC>/<C-r>"<CR>N')
