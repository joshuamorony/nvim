local map = vim.api.nvim_set_keymap;

-- center cursor after jumping
map("n", "<C-d>", "<C-d>zz", {noremap=true, silent=false})
map("n", "<C-u>", "<C-u>zz", {noremap=true, silent=false})

if vim.g.vscode then

else
	require("plugins")
	require("settings")
	require("transparent")
end
