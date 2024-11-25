-- https://github.com/LazyVim/LazyVim/blob/dbec83d57a1d5936ac860c37e0393a89b7cae7e9/lua/lazyvim/util/ui.lua#L206

local M = {}
vim.uv = vim.uv or vim.loop

-- optimized treesitter foldexpr for Neovim >= 0.10.0
function M.foldexpr()
	local buf = vim.api.nvim_get_current_buf()
	if vim.b[buf].ts_folds == nil then
		-- as long as we don't have a filetype, don't bother
		-- checking if treesitter is available (it won't)
		if vim.bo[buf].filetype == "" then
			return "0"
		end
		if vim.bo[buf].filetype:find("dashboard") then
			vim.b[buf].ts_folds = false
		else
			vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
		end
	end
	return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end

function M.run_npm_script()
	local root_markers = { "package.json" } -- todo: componser and other
	local commands = {}
	for _, marker in ipairs(root_markers) do
		local marker_file = vim.fn.findfile(marker, vim.fn.expand("%:p:h") .. ";")
		if #marker_file > 0 then
			local root = vim.fn.fnamemodify(marker_file, ":p:h") .. "/" .. marker
			local pkgString = vim.fn.system({ "cat", root })
			local pkgJson = vim.json.decode(pkgString)
			commands = {}
			for k in pairs(pkgJson.scripts) do
				table.insert(commands, "npm run " .. k)
			end
			break
		else
			print("No package.json found")
		end
	end
	if next(commands) == nil then
		print("No script found")
	else
		require("fzf-lua").fzf_exec(commands, {
			complete = function(selected)
				-- TODO: handle tasks in background
				vim.api.nvim_exec("!" .. selected[1], false)
			end,
		})
	end
end

function M.call_program()
	if vim.bo.filetype == "python" then
		vim.cmd([[!python %]])
	elseif vim.bo.filetype == "javascript" then
		vim.cmd([[!node %]])
	elseif vim.bo.filetype == "sh" then
		vim.cmd([[!bash %]])
	elseif vim.bo.filetype == "fish" then
		vim.cmd([[!fish %]])
	else
		print("No programa found to run this file:")
	end
end

return M
