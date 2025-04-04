-- https://github.com/folke/snacks.nvim
return {

	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		-- notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					cwd = true,
					indent = 2,
					limit = 10,
					padding = 2,
				},
				{
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 2,
				},
			},
		},
		picker = {},
	},
	keys = {
		{
			"<leader>d",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>cw",
			function()
				vim.cmd(":lcd " .. Snacks.git.get_root())
			end,
			desc = "Get the git root",
		},
		{
			"<leader>-",
			function()
				Snacks.explorer()
			end,
			desc = "Show explorer",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>tc")
				Snacks.toggle.treesitter():map("<leader>tt")
				Snacks.toggle.inlay_hints():map("<leader>ti")
				Snacks.toggle.diagnostics():map("<leader>td")
				Snacks.toggle.dim():map("<leader>di")
			end,
		})
	end,
}
