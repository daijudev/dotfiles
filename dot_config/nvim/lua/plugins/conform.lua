return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },

			-- Organize imports before formatting Python.
			python = { "ruff_organize_imports", "ruff_format" },
			lua = { "stylua" },
			["_"] = { "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Preserve intentional whitespace in prose and patches.
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if ft == "markdown" or ft == "diff" then
				return
			end
			return { timeout_ms = 1000, lsp_format = "fallback" }
		end,
	},
}
