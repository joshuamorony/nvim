-- add 1 space after comment delimiter
vim.api.nvim_set_var("NERDSpaceDelims", 1);
-- shortcuts to toggle
vim.api.nvim_set_keymap("n", ",c", ":call nerdcommenter#Comment(0, 'toggle')<CR>", {noremap = true});
vim.api.nvim_set_keymap("v", ",c", ":call nerdcommenter#Comment(0, 'toggle')<CR>", {noremap = true});
