local map = vim.keymap.set

-- Preserve yanks when deleting or changing text.
local blackhole_maps = {
	{ { "n", "v" }, "d", '"_d', "Delete without yanking" },
	{ { "n", "v" }, "c", '"_c', "Change without yanking" },
	{ "n", "x", '"_x', "Delete character without yanking" },
	{ "n", "X", '"_X', "Delete previous character without yanking" },
	{ { "n", "v" }, "<leader>d", "d", "Delete and yank" },
	{ { "n", "v" }, "<leader>c", "c", "Change and yank" },
	{ "n", "<leader>x", "x", "Delete character and yank" },
	{ "n", "<leader>X", "X", "Delete previous character and yank" },
}

for _, mapping in ipairs(blackhole_maps) do
	map(mapping[1], mapping[2], mapping[3], { silent = true, desc = mapping[4] })
end

-- Command-line editing.
for key, action in pairs({
	["<C-b>"] = "<Left>",
	["<C-f>"] = "<Right>",
	["<C-a>"] = "<Home>",
	["<C-e>"] = "<End>",
	["<C-h>"] = "<BS>",
	["<C-d>"] = "<Del>",
}) do
	map("c", key, action, { desc = "Command-line: " .. action })
end

map({ "n", "v" }, "<D-c>", '"+y', { silent = true, desc = "Copy to system clipboard" })
map({ "i", "c" }, "<C-;>", "<Esc>", { desc = "Exit current mode" })
map("n", "<leader>lc", "@:", { desc = "Repeat last Ex command" })
map("n", "<leader>r", "<cmd>source $MYVIMRC<CR>", { desc = "Reload configuration" })

-- LSP and diagnostics.
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
map("n", "ge", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Terminals.
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("t", "<leader>tt", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "Toggle floating terminal" })

map("n", "<leader>gg", function()
	require("config.toggleterm").toggle_lazygit()
end, { desc = "Toggle LazyGit" })

map("t", "<leader>gg", function()
	vim.cmd.stopinsert()
	require("config.toggleterm").toggle_lazygit()
end, { desc = "Toggle LazyGit" })

-- Git hunks.
local gitsigns_maps = {
	{ "n", "]c", "<cmd>Gitsigns nav_hunk next<CR>", "Next Git hunk" },
	{ "n", "[c", "<cmd>Gitsigns nav_hunk prev<CR>", "Previous Git hunk" },
	{ "n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", "Preview Git hunk" },
	{ "n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Git hunk" },
	{ "v", "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage selected Git hunk" },
	{ "n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Git hunk" },
	{ "v", "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset selected Git hunk" },
	{ "n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", "Blame current line" },
	{ "n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", "Diff current file" },
}

for _, mapping in ipairs(gitsigns_maps) do
	map(mapping[1], mapping[2], mapping[3], { desc = mapping[4] })
end

-- Explorer.
local explorer
local initial_explorer_cwd = vim.fn.getcwd()
local first_argument = vim.fn.argv(0)

if first_argument ~= "" and vim.fn.isdirectory(first_argument) == 1 then
	initial_explorer_cwd = vim.fn.fnamemodify(first_argument, ":p")
end

map("n", "<leader>e", function()
	if explorer and not explorer.closed then
		explorer:close()
		explorer = nil
		return
	end

	explorer = Snacks.explorer({ cwd = initial_explorer_cwd })
end, { desc = "Toggle explorer" })

map("n", "<leader>ll", "<C-w>l", { desc = "Focus file window" })
map("n", "<leader>hh", "<C-w>h", { desc = "Focus explorer" })
