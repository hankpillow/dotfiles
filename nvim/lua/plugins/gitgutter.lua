-- https://github.com/airblade/vim-gitgutter
return {
	"airblade/vim-gitgutter",
	events = "BufEnter",
	config = function()
		vim.g.gitgutter_enabled = 0
		vim.keymap.set("n", "<leader>tgg", vim.cmd.GitGutterToggle, { desc = "Me: Toggle gitgutter" })
		vim.keymap.set("n", "]h", vim.cmd.GitGutterNextHunk, { desc = "Me: Prev git change" })
		vim.keymap.set("n", "[h", vim.cmd.GitGutterPrevHunk, { desc = "Me: Next git change" })
		vim.keymap.set("n", "<leader>sh", vim.cmd.GitGutterStageHunk, { desc = "Me: Stage hunk" })
		vim.keymap.set("n", "<leader>uh", vim.cmd.GitGutterUndoHunk, { desc = "Me: Undo hunk" })
	end,
}
