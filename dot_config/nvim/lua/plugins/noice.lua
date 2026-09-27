return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
		},
		messages = { enabled = false },
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		views = {
			cmdline_popup = {
				relative = "editor",
				position = { row = "26%", col = "50%" },
				size = { width = 60, height = "auto" },
				border = { style = "rounded" },
			},
			popupmenu = {
				relative = "editor",
				position = { row = "50%", col = "50%" },
				size = { width = 60, height = 10 },
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
			},
		},
	},
}
