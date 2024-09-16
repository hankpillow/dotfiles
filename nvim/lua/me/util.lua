-- https://github.com/LazyVim/LazyVim/blob/dbec83d57a1d5936ac860c37e0393a89b7cae7e9/lua/lazyvim/util/ui.lua#L206

local M = {}
vim.uv = vim.uv or vim.loop

M.skip_foldexpr = {} ---@type table<number,boolean>
M.toggle = {}

local skip_check = assert(vim.uv.new_check())

---@param buf number?
function M.bufremove(buf)
	buf = buf or 0
	buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

	if vim.bo.modified then
		local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
		if choice == 0 then -- Cancel
			return
		end
		if choice == 1 then -- Yes
			vim.cmd.write()
		end
	end

	for _, win in ipairs(vim.fn.win_findbuf(buf)) do
		vim.api.nvim_win_call(win, function()
			if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
				return
			end
			-- Try using alternate buffer
			local alt = vim.fn.bufnr("#")
			if alt ~= buf and vim.fn.buflisted(alt) == 1 then
				vim.api.nvim_win_set_buf(win, alt)
				return
			end

			-- Try using previous buffer
			local has_previous = pcall(vim.cmd, "bprevious")
			if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
				return
			end

			-- Create new listed buffer
			local new_buf = vim.api.nvim_create_buf(true, false)
			vim.api.nvim_win_set_buf(win, new_buf)
		end)
	end
	if vim.api.nvim_buf_is_valid(buf) then
		pcall(vim.cmd, "bdelete! " .. buf)
	end
end

function M.foldexpr()
	local buf = vim.api.nvim_get_current_buf()

	-- still in the same tick and no parser
	if M.skip_foldexpr[buf] then
		return "0"
	end

	-- don't use treesitter folds for non-file buffers
	if vim.bo[buf].buftype ~= "" then
		return "0"
	end

	-- as long as we don't have a filetype, don't bother
	-- checking if treesitter is available (it won't)
	if vim.bo[buf].filetype == "" then
		return "0"
	end

	local ok = pcall(vim.treesitter.get_parser, buf)

	if ok then
		return vim.treesitter.foldexpr()
	end

	-- no parser available, so mark it as skip
	-- in the next tick, all skip marks will be reset
	M.skip_foldexpr[buf] = true
	skip_check:start(function()
		M.skip_foldexpr = {}
		skip_check:stop()
	end)
	return "0"
end

function M.foldtext()
	local ok = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
	local ret = ok and vim.treesitter.foldtext and vim.treesitter.foldtext()
	if not ret or type(ret) == "string" then
		ret = { { vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, false)[1], {} } }
	end
	table.insert(ret, { " 󰇘" })

	if not vim.treesitter.foldtext then
		return table.concat(
			vim.tbl_map(function(line)
				return line[1]
			end, ret),
			" "
		)
	end
	return ret
end

function M.go_to_workspace()
	local root = vim.lsp.buf.list_workspace_folders()[1]
	print("Changing path to:" .. root)
	vim.cmd(":lcd " .. root)
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

function M.toggle.inlay_hint()
	if vim.lsp.inlay_hint.is_enabled({ 0 }) then
		vim.lsp.inlay_hint.enable(false)
	else
		vim.lsp.inlay_hint.enable()
	end
end

function M.toggle.conceallevel()
	if vim.opt.conceallevel:get() == 2 then
		vim.opt.conceallevel = 0
	else
		vim.opt.conceallevel = 2
	end
end

function M.on_supports_method(method, fn)
	M._supports_method[method] = M._supports_method[method] or setmetatable({}, { __mode = "k" })
	return vim.api.nvim_create_autocmd("User", {
		pattern = "LspSupportsMethod",
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local buffer = args.data.buffer ---@type number
			if client and method == args.data.method then
				return fn(client, buffer)
			end
		end,
	})
end

return M
