local keymap = vim.keymap
local e_opts = { noremap = true, expr = true }
local s_opts = { noremap = true, silent = true }

-- Exit
keymap.set("n", "<leader>q", ":q!<CR>") -- quit
keymap.set("n", "<leader>Q", ":qa!<CR>") -- quit without saving
keymap.set("n", "<leader>w", ":w<CR>") -- write
keymap.set("n", "<leader>wq", ":wq<CR>") -- write
keymap.set("n", "<leader>wqa", ":wqa!<CR>") -- write

keymap.set("n", "<C-b>", function()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
		if filetype:match("netrw") then
			vim.cmd(bufnr .. "bwipeout!")
			return
		end
	end
	vim.cmd("Vex")
end, { noremap = true, silent = false })
keymap.set("n", "-", vim.cmd.Ex)

---- utils
keymap.set("n", "<F5>", ":source ~/.config/nvim/init.lua<CR>", { desc = "Refresh neovim config" })
keymap.set("n", "<leader>cd", ":lcd %:p:h<CR>", { desc = "Change local path to files path" })
keymap.set("n", "<leader>cw", ":lcd %:p:h<CR>", { desc = "Change local path to workspace directory" })

---- Move
keymap.set({ "n", "x" }, "]j", "g,") -- prev jump list
keymap.set({ "n", "x" }, "[j", "g;") -- next jump list
keymap.set("n", "]v", "'>") -- jump to end of visual selection
keymap.set("n", "[v", "'<") -- jump to start of visual selection
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', e_opts)
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', e_opts)
keymap.set({ "n", "x" }, "E", "g_", s_opts) -- end of line
keymap.set({ "n", "x" }, "B", "^", s_opts) -- start of line

-- Editing
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" })
keymap.set("n", "J", "mzJ`z", { desc = "Keep the cursor while joining the lines" })
keymap.set("i", "<C-Del>", "<C-o>dW", { desc = "Delete word under cursor" })
keymap.set("n", "<leader>o", "i<CR><ESC>g;", { desc = "Create line break and return previous position" })
keymap.set(
	{ "n", "v" },
	"<A-o>",
	"i<CR><CR><Up>",
	{ noremap = true, desc = "Insert line break at cursor and change to insert mode" }
)

---- nav
keymap.set("n", "n", "nzz", { desc = "Center cursor after traversing search" })
keymap.set("n", "N", "Nzz", { desc = "Center cursor after traversing search" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after traversing search" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after traversing search" })
keymap.set("n", "*", "*Nzz", { desc = "Select next match and center line vertically" })

---- toggles
keymap.set("n", "<leader>ts", ":set invspell<CR>", { desc = "Toggle spell check" })
keymap.set("n", "<leader>tl", ":set list!<CR>", { desc = "Toggle list (invisible)" })
keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle wrap" })
keymap.set("n", "<leader>tp", "<F12>'+P<F12>", { desc = "Toggle paste mode" })

-- copy and paste
keymap.set({ "n", "x" }, "Y", "yy", { desc = "Copy (yank) full line" })
keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste from reg 0" })
keymap.set({ "s", "v" }, "<leader>y", [["+y]], { desc = "Copy (yank) to system copiboard register" })
keymap.set("i", "<C-v>", "<C-R>+", { desc = "Paste from system clipboard" })
keymap.set("s", "<C-v>", "<BS>i<C-R>+", { desc = "Paste from system clipboard" })

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

---- Buffer
keymap.set("n", "<leader>d", ":Bdelete<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>D", ":bufdo :Bdelete<CR>", { desc = "Delete all buffers" })

---- Find & Replace
keymap.set(
	"n",
	"<leader>r",
	[[:.,$s///gcI<Left><Left><Left><Left><Left>]],
	{ desc = "Find and replace text from current line to end of file" }
)
keymap.set(
	"n",
	"<leader>R",
	[[:s///gcI<Left><Left><Left><Left><Left>]],
	{ desc = "Starts find and replace command that affects the current buffer" }
)
keymap.set(
	"v",
	"<leader>r",
	[[y:.,$s/<C-r><C-r>"//gc<Left><Left><Left>]],
	{ desc = "Replace selection from current line to end of file" }
)
keymap.set(
	"n",
	"<leader>rw",
	[[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "Replace word from current line to end of file" }
)
