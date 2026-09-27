-- Reset the macOS input source to English after leaving an input context.
--
-- Install macism:
--   brew tap laishulu/homebrew
--   brew install macism
-- Run `macism` without arguments to identify the active input source.
local M = {}

local state = {
	exe = nil,
	english = nil,
	running = false,
}

local function to_english()
	if state.running then
		return
	end
	state.running = true

	vim.system({ state.exe, state.english }, {}, function(obj)
		state.running = false

		if obj.code ~= 0 then
			vim.schedule(function()
				vim.notify("macism failed: " .. vim.trim(obj.stderr or ""), vim.log.levels.ERROR)
			end)
		end
	end)
end

function M.setup(opts)
	opts = opts or {}

	if vim.fn.has("mac") == 0 then
		return
	end

	local exe = vim.fn.exepath("macism")
	if exe == "" then
		vim.notify("macism not found; automatic IME switching is disabled", vim.log.levels.WARN)
		return
	end

	state.exe = exe
	state.english = opts.english_input or "com.apple.keylayout.ABC"

	local group = vim.api.nvim_create_augroup("config.ime", { clear = true })
	vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave", "FocusGained" }, {
		group = group,
		callback = to_english,
		desc = "Switch input source to English",
	})
end

return M
