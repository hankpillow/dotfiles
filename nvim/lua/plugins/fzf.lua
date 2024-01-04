return {
	"mhinz/vim-grepper", -- https://github.com/mhinz/vim-grepper/wiki/using-the-commands
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua", -- https://github.com/ibhagwan/fzf-lua#installation
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({ "fzf.vim" })

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

			vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function()
				require("fzf-lua").complete_file({
					cmd = "rg --files",
					winopts = { preview_opts = "hidden" },
				})
			end, { silent = true, desc = "Fuzzy complete file on insert mode" })

			vim.keymap.set("n", "<F5>", function()
				local root_markers = { "package.json" }
				local commands = {}
				for _, marker in ipairs(root_markers) do
					local marker_file = vim.fn.findfile(marker, vim.fn.expand("%:p:h") .. ";")
					if #marker_file > 0 then
						local root = vim.fn.fnamemodify(marker_file, ":p:h") .. "/" .. marker
						local pkgString = vim.fn.system({ "cat", root })
						local pkgJson = vim.json.decode(pkgString)
						commands = {}
						for k in pairs(pkgJson.scripts) do
							table.insert(commands, k)
						end
						break
					end
				end
				if next(commands) == nil then
					print("No package.json found")
				else
					require("fzf-lua").fzf_exec(commands, {
						complete = function(selected)
							vim.api.nvim_exec("! npm run " .. selected[1], false)
						end,
					})
				end
			end, { noremap = true, silent = true, desc = "List npm scripts" })
		end,
	},
}
