return {
	"mhinz/vim-grepper", -- https://github.com/mhinz/vim-grepper/wiki/using-the-commands
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua", -- https://github.com/ibhagwan/fzf-lua#installation
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({
				"fzf.vim",
				grep = {
					multiprocess = true,
					-- debug = true,
				},
				live_grep = {
					multiprocess = true,
					-- debug = true,
				},
			})

			local opts = { noremap = true, silent = true }
			local no_hidden = { preview_opts = "hidden" }

			vim.keymap.set("n", "<C-k>", function()
				fzf.builtin()
			end, opts)

			vim.keymap.set("n", "<A-k>", function()
				fzf.commands()
			end, opts)

			vim.keymap.set("n", "<C-p>", function()
				fzf.git_files(no_hidden)
			end, { noremap = true, silent = true, desc = "Find git files" })

			vim.keymap.set("n", "<A-p>", function()
				fzf.files(no_hidden)
			end, { noremap = true, silent = true, desc = "Find files" })

			vim.keymap.set("n", "<C-b>", function()
				fzf.buffers(no_hidden)
			end, { noremap = true, silent = true, desc = "Find buffers" })

			vim.keymap.set("n", "<space>?", function()
				fzf.oldfiles({ preview_opts = "hidden" })
			end, { noremap = true, silent = true, desc = "Find on history" })

			vim.keymap.set({ "i" }, "<C-x><C-f>", function()
				require("fzf-lua").complete_path()
			end, { silent = true, desc = "Find files on insert mode" })
		end,
	},
}
