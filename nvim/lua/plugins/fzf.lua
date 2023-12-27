return {
	"mhinz/vim-grepper", -- https://github.com/mhinz/vim-grepper/wiki/using-the-commands
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua", -- https://github.com/ibhagwan/fzf-lua#installation
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({ "fzf.vim" })

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<C-k>", function()
				fzf.builtin()
			end, opts)

			vim.keymap.set("n", "<A-k>", function()
				fzf.commands()
			end, opts)

			vim.keymap.set("n", "<C-p>", function()
				fzf.git_files({ preview_opts = "hidden" })
			end, opts)

			vim.keymap.set("n", "<A-p>", function()
				fzf.files({ preview_opts = "hidden" })
			end, opts)

			vim.keymap.set("n", "<space><space>", function()
				fzf.buffers({ preview_opts = "hidden" })
			end, opts)

			vim.keymap.set("n", "<space>?", function()
				fzf.oldfiles({ preview_opts = "hidden" })
			end, opts)

			-- vim.keymap.set("n", "<C-g>", fzf.live_grep_glob, opts)
			-- vim.keymap.set("v", "<C-g>", fzf.grep_visual, opts)

			vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function()
				require("fzf-lua").complete_file({
					cmd = "rg --files",
					winopts = { preview_opts = "hidden" },
				})
			end, { silent = true, desc = "Fuzzy complete file on insert mode" })
		end,
	},
}
