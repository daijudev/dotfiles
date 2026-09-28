return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup()
		require("mini.completion").setup()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "snacks_picker_input",
			callback = function()
				vim.b.minicompletion_disable = true
			end,
		})

		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.statusline").setup()
		require("mini.ai").setup()
		require("mini.trailspace").setup()
		vim.keymap.set("n", "<leader>tw", function()
			MiniTrailspace.trim()
		end, { desc = "Trim trailing whitespace" })

		vim.keymap.set("n", "<leader>tL", function()
			MiniTrailspace.trim_last_lines()
		end, { desc = "Trim trailing empty lines" })
	end,
}
