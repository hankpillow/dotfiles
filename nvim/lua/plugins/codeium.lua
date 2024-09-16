return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- require("codeium").setup({
		-- 	detect_proxy = true,
		-- 	enterprise_mode = true,
		-- 	tools = {
		-- 		language_server = "/home/igor/workspace/language_server_linux_x64",
		-- 	},
		-- 	api = {
		-- 		host = "codeium.prdlvgpu4.aiaccel.dell.com",
		-- 	},
		-- })
	end,
}
-- return {
-- 	"Exafunction/codeium.vim",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"hrsh7th/nvim-cmp",
-- 	},
-- 	config = function()
-- 		--		vim.cmd([[let g:codeium_server_config = {
-- 		--  \'portal_url': 'https://codeium.prdlvgpu4.aiaccel.dell.com',
-- 		--  \'api_url': 'https://codeium.prdlvgpu4.aiaccel.dell.com/_route/api_server' }
-- 		-- ]])
-- 		-- require("codeium").setup({
-- 		-- 	enterprise_mode = true,
-- 		-- 	api = {
-- 		-- 		portal_url = "https://codeium.prdlvgpu4.aiaccel.dell.com",
-- 		-- 		-- api_url =    "https://codeium.prdlvgpu4.aiaccel.dell.com/_route/api_server",
-- 		-- 	},
-- 		-- })
-- 	end,
-- }
