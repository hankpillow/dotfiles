-- Insert mode handy maps
-- CTRL-W    delete word to the left of cursor
-- CTRL-O D  delete everything to the right of cursor
-- CTRL-U    delete everything to the left of cursor
-- CTRL-H    backspace/delete
-- CTRL-J    insert newline (easier than reaching for the return key)
-- CTRL-T    indent current line
-- CTRL-D    un-indent current line

local keymap = vim.keymap
local s_opts = { noremap = true, silent = true }

-- Exit and save
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Me: Quit without saving" })
keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Me: Quit all without saving" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Me: Save" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Me: Save qna quit" })
keymap.set("n", "<leader>d", ":lua require'me.util'.bufremove()<cr>", { desc = "Delete Buffer" })

-- Move up and down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Me: Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Me: Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Me: Up", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Me: Up", expr = true, silent = true })

keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Me: Escape and Clear hlsearch" })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move horizontally
keymap.set({ "n", "x" }, "E", "g_", { desc = "Me: go to the end of the line" })
keymap.set({ "n", "x" }, "B", "^", { desc = "Me: go to the start of the line" })

keymap.set({ "n", "x" }, "]j", "g,", { desc = "Me: next jump list" })
keymap.set({ "n", "x" }, "[j", "g;", { desc = "Me: prev jump list" })

keymap.set("n", "]v", "'>", { desc = "Me: jump to next visual selection" })
keymap.set("n", "[v", "'<", { desc = "Me: jump to next visual selection" })

-- Join lines
keymap.set("n", "J", "mzJ`z", { desc = "Me: Keep the cursor while joining the lines", noremap = true })
keymap.set("i", "<C-Del>", "<C-o>dW", { desc = "Me: Delete word under cursor", noremap = true })

-- Create new lines
keymap.set("n", "<leader>o", "i<CR><ESC>g;", { desc = "Me: Create line break and return previous position" })
keymap.set(
	{ "n", "v" },
	"<A-o>",
	"i<CR><CR><Up>",
	{ noremap = true, desc = "Me: Insert line break at cursor and change to insert mode" }
)

---- utils
keymap.set("n", "<leader>cd", ":lcd %:p:h<CR>", { desc = "Me: Change path to files path" })
keymap.set("n", "-", vim.cmd.Ex, { desc = "Me: Open netrw" })
keymap.set(
	"n",
	"<leader>cw",
	":lua require'me.util'.go_to_workspace()<cr>",
	{ desc = "Me: Change path to workspace directory" }
)
keymap.set(
	"n",
	"<F8>",
	":lua require'me.util'.call_program()<cr>",
	{ desc = "Me: Execute current file according to filetype", noremap = true, silent = true }
)
keymap.set(
	"n",
	"<F5>",
	":lua require'me.util'.run_npm_script()<cr>",
	{ noremap = true, silent = true, desc = "Me: List npm scripts" }
)

-- better indenting
-- keymap.set("v", "<", "<gv", { desc = "Me: Indent backward" })
-- keymap.set("v", ">", ">gv", { desc = "Me: Indent forward" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Me: Indent backward" })
keymap.set("v", "<Tab>", ">gv", { desc = "Me: Indent forward" })

---- nav
keymap.set("n", "n", "nzz", { desc = "Me: Center cursor after traversing search" })
keymap.set("n", "N", "Nzz", { desc = "Me: Center cursor after traversing search" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Me: Center cursor after traversing search" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Me: Center cursor after traversing search" })
keymap.set("n", "*", "*Nzz", { desc = "Me: Select next match and center line vertically" })

---- toggles
keymap.set("n", "<leader>ts", ":set invspell<CR>", { desc = "Me: Toggle spell check" })
keymap.set("n", "<leader>tl", ":set list!<CR>", { desc = "Me: Toggle list (invisible)" })
keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Me: Toggle wrap" })
keymap.set("n", "<leader>tp", "<F12>'+P<F12>", { desc = "Me: Toggle paste mode" })
keymap.set("n", "<leader>tc", ":lua require'me.util'.toggle.conceallevel()<CR>", { desc = "Me: Toggle conceallevel" })

-- copy and paste
keymap.set({ "n", "x" }, "Y", "yy", { desc = "Me: Copy (yank) full line" })
keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Me: Paste from reg 0" })
keymap.set({ "s", "v" }, "<leader>y", [["+y]], { desc = "Me: Copy (yank) to system copiboard register" })
keymap.set("i", "<C-v>", "<C-R>+", { desc = "Me: Paste from system clipboard" })
keymap.set("s", "<C-v>", "<BS>i<C-R>+", { desc = "Me: Paste from system clipboard" })

---- duplicate
keymap.set("n", "<A-K>", "yyP")
keymap.set("n", "<A-J>", "yyp")
keymap.set("x", "<A-K>", "y :normal P<CR>")
keymap.set("x", "<A-J>", "y :normal '>p<CR>")

---- fix accidental line joining during visual block selection
keymap.set("v", "J", "j")
keymap.set("v", "K", "k")
keymap.set("n", "<M-]>", ">>")
keymap.set("n", "<M-[>", "<<")

-- Invoke search/replace
keymap.set(
	"n",
	"<leader>r",
	[[:.,$s///gcI<Left><Left><Left><Left><Left>]],
	{ desc = "Me: Find and replace text from current line to end of file" }
)

keymap.set(
	"n",
	"<leader>R",
	[[:s///gcI<Left><Left><Left><Left><Left>]],
	{ desc = "Me: Starts find and replace command that affects the current buffer" }
)

keymap.set(
	"v",
	"<leader>r",
	[[y:.,$s/<C-r><C-r>"//gc<Left><Left><Left>]],
	{ desc = "Me: Replace selection from current line to end of file" }
)

keymap.set(
	"n",
	"<leader>rw",
	[[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "Me: Replace word from current line to end of file" }
)
