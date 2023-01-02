local map = vim.keymap.set
local e_opts = { expr = true }
local s_opts = { silent = true }
local se_opts = { silent = true, expr = true }

-- file
-----------------------------------------------------------------------------------
map("n", "<leader>q", ":q<CR>", s_opts) -- quit
map("n", "<leader>Q", ":qa!<CR>", s_opts) -- quit without saving
map("n", "<Leader>w", function()
    if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
        return "<cmd>cclose<CR>"
    else
        return "<cmd>bd!<CR>"
    end
end, se_opts)
map("n", "<leader>wq", ":wq<CR>", s_opts) -- write
map("v", "<leader>w", ":w<CR>", s_opts) -- write
map("v", "<leader>wq", ":wq<CR>", s_opts) -- write

-- utils
map("n", "<F5>", ":source ~/.config/nvim/init.vim<CR>", s_opts) -- reload nvim config
map("n", "<leader>cd", ":lcd %:p:h<CR>", s_opts) -- change current work dir to current file
map("n", "<leader>gs", ":Git<CR>", s_opts) -- open vim fugitive

-- insert
map("i", "<C-BS>", "<C-w>", s_opts) -- Delete previous word
map("i", "<C-Del>", "<C-o>dW", s_opts) -- Delete next word

-- Move
map("n", "]j", "g,", s_opts) -- prev jump list
map("n", "[j", "g;", s_opts) -- next jump list
map("n", "j", "v:count == 0 ? 'gj' : 'j'", e_opts)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", e_opts)
map("n", "E", "g_") -- end of line
map("n", "B", "^") -- start of line

-- Center cursor after traversing search
map("n", "n", "nzz", s_opts)
map("n", "N", "Nzz", s_opts)

-- Toggle fold (single level)
map("n", "<Space>", "foldlevel('.') ? 'za' : '<Space>'", se_opts)

-- toggles
map("n", "<F10>", "<cmd>setlocal spell!<CR>", s_opts)
map("n", "<leader>l", "set list!<CR>", s_opts) -- show invisible
map("n", "<leader>;", "set wrap!<CR>", s_opts) -- wrap/unwrap lines

-- Paste from system clipboard in insert/select mode
map("i", "<C-v>", "<C-R>+", s_opts)      
map("s", "<C-v>", "<BS>i<C-R>+", s_opts)

-- Toggle paste mode and paste from system clipboard
map("n", "<Leader>v", '<F12>"+P<F12>', s_opts)
map("i", "<Leader>v", '<ESC><F12>"+P<F12>i', s_opts)

-- Copy/yank
map("n", "Y", '"+yg_', s_opts) -- yank entire line
map("n", "y", '"+y', s_opts) -- Always yank to clipboard
map("v", "y", '"+y', s_opts) -- Always yank to clipboard

-- Duplicate
map("n", "<A-K>" ,"yyP", s_opts)
map("n", "<A-J>" ,"yyp", s_opts)
map("v", "<A-K>" ,"yP)", s_opts)
map("v", "<A-J>" ,"yp)", s_opts)

-- Fix accidental line joining during visual block selection
map("v", "J", "j", s_opts)
map("v", "K", "k", s_opts)

-- Indenting
map("n", "<A-F>", "gg=G''zz<Esc>", s_opts) -- format document
map("n", "<M-]>", ">>", s_opts)
map("n", "<M-[>", "<<", s_opts)

-- Buffer
map("n", "<leader>d", ":Bdelete<CR>", s_opts) -- delete buffer
map("n", "<leader>D", ":bufdo :Bdelete<CR>", s_opts) -- delete all buffers
map("n", "[b", ":bprev<CR>", s_opts) -- prev buffer
map("n", "]b", ":bnext<CR>", s_opts) -- next buffer

map("n", "[z", "zk") -- perv fold 
map("n", "]z", "zj") -- next fold
--
-- Find & Replace
map("n", "<leader>r", ":%s///gc<left><left><left><left>", s_opts)
map("v", "<leader>r", ":%s///gc<left><left><left><left>", s_opts)
--map("v", "//", "y/<C-R>\"<CR>", s_opts) -- copy selection on visual mode and start searching
map("n", "*", "*N", s_opts) -- select current work and don't move to next match 
map("n", "<F2>", "yviw*N:%s///g<left><left>", s_opts)
