-- Bootstrap lazy.nvim.
local uv = vim.uv or vim.loop
local lazypath = vim.env.LAZY_PATH or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.env.LAZY_PATH and not uv.fs_stat(lazypath) then
	vim.api.nvim_echo({
		{
			"Cloning lazy.nvim\n\n",
			"DiagnosticInfo",
		},
	}, true, {})
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local ok, out = pcall(vim.fn.system, {
		"git",
		"clone",
		"--filter=blob:none",
		lazyrepo,
		lazypath,
	})
	if not ok or vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim\n", "ErrorMsg" },
			{ vim.trim(out or ""), "WarningMsg" },
			{ "\nPress any key to exit...", "MoreMsg" },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
