vim.opt.wrap = true;
vim.opt.textwidth = 80;

vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true, silent = true })

--Disable header folding
vim.g.vim_markdown_folding_disabled = 1

--Disable math tex conceal and syntax highlight
vim.g.tex_conceal = ''
vim.g.vim_markdown_math = 0

--Support front matter of various format
vim.g.vim_markdown_frontmatter = 1  --for YAML format
-- vim.g.vim_markdown_toml_frontmatter = 1  --for TOML format
-- vim.g.vim_markdown_json_frontmatter = 1  --for JSON format

--Let the TOC window autofit so that it doesn't take too much space
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_fenced_languages = {'python', 'javascript', 'lua', 'bash=sh', 'html', 'css', 'typescript', 'jsx', 'tsx', 'ts', 'js'}

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
vim.g.vim_markdown_override_syntax = 1

-- don't conceal code fences
vim.cmd([[
  let g:pandoc#syntax#conceal#use = 0
  let g:pandoc#syntax#codeblocks#embeds#langs#prefix = "```"
  let g:pandoc#syntax#codeblocks#embeds#langs#suffix = "```"
]])

vim.cmd([[autocmd FileType markdown setlocal syntax=pandoc]])

vim.cmd([[
  augroup markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal textwidth=80
    autocmd FileType markdown setlocal formatoptions+=a
  augroup END
]])
