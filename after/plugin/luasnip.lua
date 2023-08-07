if not pcall(require, "luasnip") then
	return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/josh/snippets/" } })

ls.config.set_config({
	history = true,

	updateevents = "TextChanged, TextChangedI",

	enable_autosnippets = true,
})

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
