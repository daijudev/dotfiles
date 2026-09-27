-- Motion responsibilities:
--
--   f/F/t/T      clever-f.vim (repeat motion and Japanese via migemo)
--   <leader>j    flash.nvim (label-based jumps)
--   / and ?      native search
return {
	{
		"folke/flash.nvim",
		keys = {
			{
				"<leader>j",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
		},
		opts = {
			modes = {
				-- Keep character motions owned by clever-f.vim.
				char = { enabled = false },
			},
		},
	},
	{
		"rhysd/clever-f.vim",
		event = "VeryLazy",
		init = function()
			-- clever-f ships the migemo patterns; no external cmigemo is needed.
			vim.g.clever_f_use_migemo = 1
			vim.g.clever_f_fix_key_direction = 1
			vim.g.clever_f_show_prompt = 1
		end,
	},
}
