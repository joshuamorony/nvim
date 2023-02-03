if not pcall(require, "luasnip") then
  return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    history = true,

    updateevents = "TextChanged, TextChangedI",

    enable_autosnippets = true,
}

vim.keymap.set({"i", "s"}, "<c-k>", function ()
   if ls.expand_or_jumpable() then
    ls.expand_or_jump()
   end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<c-j>", function ()
   if ls.jumpable(-1) then
    ls.jump(-1)
   end
end, {silent = true})

vim.keymap.set({"i"}, "<c-l>", function ()
   if ls.choice_active() then
    ls.change_choice(1)
   end
end, {silent = true})


local snippet = ls.s
local t = ls.text_node

ls.add_snippets(nil, {

    snippet("expand", t "hooray"),

})

