require("indent_blankline").setup {
  char = "▏",
  buftype_exclude = {"terminal"},
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {"help", "terminal"},
  -- default : {'class', 'function', 'method'}
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
