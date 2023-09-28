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

keymap.set('n', '<C-b>', function()
    echo "default netrw"
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if filetype:match('netrw') then
            vim.cmd(bufnr .. 'bwipeout!')
            return
        end
    end
    vim.cmd('Vex')
end, { noremap = true, silent = false })
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
keymap.set({ 'n', 'x' }, 'E', 'g_', s_opts) -- end of line
keymap.set({ 'n', 'x' }, 'B', '^', s_opts) -- start of line
keymap.set( 'n' , '<leader>o', 'i<CR><ESC>g;') --  insert new line below 

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
keymap.set({ 'n', 'x' }, '<leader>p', '"0p') -- paste from 0
keymap.set({ 's', 'v' }, "<leader>y", [["+y]]) -- yank to clipboard

---- Duplicate
keymap.set('n', '<A-K>', 'yyP')
keymap.set('n', '<A-J>', 'yyp')
keymap.set('x', '<A-K>', 'y :normal P<cr>')
keymap.set('x', '<A-J>', 'y :normal \'>p<cr>')

---- Fix accidental line joining during visual block selection
keymap.set('v', 'J', 'j')
keymap.set('v', 'K', 'k')

keymap.set('n', '<M-]>', '>>')
keymap.set('n', '<M-[>', '<<')

---- Buffer
keymap.set('n', '<leader>d', ':Bdelete<CR>') -- delete buffer
keymap.set('n', '<leader>D', ':bufdo :Bdelete<CR>') -- delete all buffers
keymap.set('n', '[b', ':bprev<CR>') -- prev buffer
keymap.set('n', ']b', ':bnext<CR>') -- next buffer

---- Find & Replace
keymap.set('n', '<leader>r', [[:.,$s///gcI<left><left><left><left>]])
keymap.set('v', '<leader>r', [[y:.,$s/<C-r><C-r>"//g<Left><Left>]])
keymap.set("n", "<leader>rw", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])
keymap.set('n', '*', '*Nzz') -- select current work and don't move to next match
keymap.set('x', '<F2>', 'y<ESC>/<C-r>"<CR>N')
-- keymap.set('n', '<F12>', 'gd') -- go to definition

-- Create the key mapping
keymap.set("n", "<A-F>", function()
    -- Save the current cursor position
    local save_cursor = vim.api.nvim_win_get_cursor(0)

    -- Try to format using Prettier
    if vim.fn.executable('prettier') == 1 then
        local file = vim.fn.expand("%:p")
        local result  = vim.fn.system("prettier --file-info " .. file)
        local hasParser = string.match(result, 'inferredParser": ".*"')
        if hasParser then
            local check = vim.fn.system("prettier --check " .. file)
            if string.match(check, "[error]:") then
                print(vim.inspect(check))
                return
            end
            vim.cmd("%! prettier --stdin-filepath " .. file)
            vim.api.nvim_win_set_cursor(0, save_cursor)
            print("Formatted using Prettier")
            return
        end
    end

    -- Check if LSP is attached to current buffer
    if vim.lsp.buf.server_ready() then
        local success, result = pcall(vim.lsp.buf.format, {
            -- filter = function(client) return client.name ~= "tsserver" end
            async=true,
            formatting_options = {
                tabSize = 2,
                printWidth = 100,
                insertSpace = false,
                trimTrailingWhitespace = true,
                insertFinalNewline  = true,
                trimFinalNewlines = true
            }
        })
        if success then
            print("Formatted using LSP")
            vim.api.nvim_win_set_cursor(0, save_cursor)
            return
        end
        print("LSP formatting failed: " .. result)
    end

    -- Use the built-in formatter as a last resort
    print("Formatted using built-in formatter")
    vim.cmd("normal! gg=G")

    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, save_cursor)

end, { noremap = true })

