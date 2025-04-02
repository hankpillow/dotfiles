return {
	-- manual intall { "junegunn/fzf", build = "./install --bin" },
	{
		-- https://github.com/ibhagwan/fzf-lua#installation
		"ibhagwan/fzf-lua",
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({
				"fzf-vim",
				grep = {
					multiprocess = true,
					-- debug = true,
				},
				live_grep = {
					multiprocess = true,
					-- debug = true,
				},
			})

			vim.keymap.set("n", "<C-k>", function()
				fzf.builtin()
			end, { noremap = true, silent = true, desc = "Me: fzf builtin commands" })

			vim.keymap.set("n", "<A-k>", function()
				fzf.commands()
			end, { noremap = true, silent = true, desc = "Me: neovim commands" })

			vim.keymap.set("n", "<leader>ca", function()
				fzf.lsp_code_actions()
			end, { noremap = true, silent = true, desc = "Me: LSP code actions" })

			vim.keymap.set("n", "<C-p>", function()
				fzf.git_files()
			end, { noremap = true, silent = true, desc = "Me: Find git files" })

			vim.keymap.set("n", "<A-p>", function()
				fzf.files()
			end, { noremap = true, silent = true, desc = "Me: Find files" })

			vim.keymap.set("n", "<C-b>", function()
				fzf.buffers()
			end, { noremap = true, silent = true, desc = "Me: Find buffers" })

			vim.keymap.set("n", "<C-g>", function()
				fzf.live_grep()
			end, { noremap = true, silent = true, desc = "Me: Grep project" })

			vim.keymap.set("n", "<A-g>", function()
				fzf.grep_cword()
			end, { noremap = true, silent = true, desc = "Me: Grep current word" })

			vim.keymap.set({ "i" }, "<C-x><C-f>", function()
				require("fzf-lua").complete_path()
			end, { silent = true, desc = "Me: Find files on insert mode" })
		end,
	},
}
