return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		quickfile = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					matcher = {
						fuzzy = false,
						smartcase = true,
						ignorecase = false,
					},
					actions = {
						toggle_case = function(picker)
							local matcher_opts = picker.opts.matcher

							local ignorecase = not matcher_opts.ignorecase

							matcher_opts.ignorecase = ignorecase
							matcher_opts.smartcase = false

							-- Rebuild the active matcher with the updated options.
							picker.matcher:abort()
							picker.matcher:close()

							picker.matcher = require("snacks.picker.core.matcher").new(matcher_opts)

							vim.notify(ignorecase and "Explorer: Ignore Case" or "Explorer: Case Sensitive")

							picker:find({ refresh = true })
						end,
					},
					win = {
						input = {
							keys = {
								["<C-c>"] = {
									"toggle_case",
									mode = { "i", "n" },
									desc = "Toggle Case Sensitive",
								},
							},
						},
					},
				},
			},
		},
		explorer = { enabled = true },
		notifier = { enabled = true, timeout = 2500 },
		notify = { enabled = true },
		indent = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		git = { enabled = true },
		rename = { enabled = true },
		words = { enabled = true },
		image = { enabled = true },
	},
	keys = {
		{
			"<leader>p",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader><tab>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>gB",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>rN",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename file (LSP-aware)",
		},
		{
			"<leader>ld",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"<leader>lr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "Goto References",
		},
		{
			"<leader>li",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"<leader>lt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Document Symbols",
		},
		{
			"<leader>ws",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "Workspace Symbols",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open LazyGit",
		},
	},
}
