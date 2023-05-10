vim.cmd [[highlight IndentBlanklineIndent1 guifg=#35353a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#35353a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#35353a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#35353a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#35353a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#35353a gui=nocombine]]

require("indent_blankline").setup {
  char = "▏",
  buftype_exclude = {"terminal"},
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {"help", "terminal"},
  -- default : {'class', 'function', 'method'}
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
  context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "^type",
    "^import",
    "block",
    "arguments"
  }
  -- disabled now for performance hit.
  -- use_treesitter = true
}
