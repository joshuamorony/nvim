local null_ls = require("null-ls")

local format = require("josh.custom.lsp.format")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.stylelint,
		null_ls.builtins.code_actions.cspell.with({
			filetypes = { "markdown", "tex", "text", "svx" },
		}),
		null_ls.builtins.diagnostics.cspell.with({
			filetypes = { "markdown", "tex", "text", "svx" },
		}),
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

local prettier = require("prettier")

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"lua",
		"svelte",
		"vue",
		"ng",
	},
	cli_options = {
		trailing_comma = "es5",
	},
})
