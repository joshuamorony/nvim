local null_ls = require("null-ls")

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end

        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end
    end,
})

local prettier = require("prettier")

prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.22+)
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
        "lua"
    },
})
