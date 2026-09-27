local toggleterm = require("toggleterm")
local float_opts = { border = "curved" }

toggleterm.setup({
	direction = "float",
	float_opts = float_opts,
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true,
	float_opts = float_opts,
})

local M = {}

function M.toggle_lazygit()
	lazygit:toggle()
end

return M
