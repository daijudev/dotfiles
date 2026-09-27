vim.api.nvim_create_user_command("InitLua", function()
	vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
end, {})

local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })
local function create_autocmd(event, opts)
	opts.group = augroup
	vim.api.nvim_create_autocmd(event, opts)
end

create_autocmd("BufWritePre", {
	callback = function(event)
		local dir = vim.fs.dirname(event.file)
		local force = vim.v.cmdbang == 1
		if
			vim.fn.isdirectory(dir) == 0
			and (force or vim.fn.confirm('"' .. dir .. '" does not exist. Create?', "&Yes\n&No") == 1)
		then
			vim.fn.mkdir(dir, "p")
		end
	end,
	desc = "Create missing parent directories before saving",
})

create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	command = "checktime",
	desc = "Reload files changed outside Neovim",
})

create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
	desc = "Show diagnostics under the cursor",
})
