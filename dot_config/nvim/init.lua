-- Set the leader before loading plugins and keymaps.
vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("config.ime").setup({
	english_input = "com.apple.keylayout.ABC",
})

require("config.lazy")
