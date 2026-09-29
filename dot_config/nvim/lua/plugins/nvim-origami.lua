return {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
	end,
	opts = {
		useLspFoldsWithTreesitterFallback = {
			enabled = true,
			foldmethodIfNeitherIsAvailable = "indent",
		},
		pauseFoldsOnSearch = true,
		foldtext = {
			enabled = true,
			padding = {
				width = 2,
			},
			lineCount = {
				template = "%d lines",
				hlgroup = "Comment",
			},
			diagnosticCount = true,
			gitsignsCount = false,
			disableOnFt = { "snacks_picker_input" },
		},
		autoFold = {
			enabled = false,
		},
		foldKeymaps = {
			setup = false,
			closeOnlyOnFirstColumn = false,
			scrollLeftOnCaret = false,
		},
	},
}
