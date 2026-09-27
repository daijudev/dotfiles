return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "day",
		light_style = "day",
		transparent = false,
		day_brightness = 0.3,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight-day")
		vim.api.nvim_set_hl(0, "nCursor", { bg = "#457BE2" })
		vim.api.nvim_set_hl(0, "iCursor", { bg = "#5E7440" })
	end,
}
