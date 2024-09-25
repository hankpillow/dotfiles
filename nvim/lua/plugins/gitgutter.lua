-- https://github.com/airblade/vim-gitgutter
return {
	"airblade/vim-gitgutter",
	events = "BufEnter",
	config = function()
		vim.g.gitgutter_enabled = 0
		vim.keymap.set("n", "<leader>tgg", vim.cmd.GitGutterToggle, { desc = "Toggle gitgutter" })
		vim.keymap.set("n", "]h", vim.cmd.GitGutterNextHunk, { desc = "Prev git change" })
		vim.keymap.set("n", "[h", vim.cmd.GitGutterPrevHunk, { desc = "Next git change" })
		vim.keymap.set("n", "<F10>", vim.cmd.GitGutterPreviewHunk, { desc = "Preview git changes" })
	end,
}
