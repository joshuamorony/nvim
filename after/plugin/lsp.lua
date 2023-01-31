local lsp = require('lsp-zero')
local lsp_util = require('lspconfig.util');

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'angularls',
    'html',
    'cssls',
    'sumneko_lua',
    'jsonls'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('denols', {
    root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
})

lsp.configure('tsserver', {
    root_dir = lsp_util.root_pattern("package.json"),
})

local bin_name = 'nxls'
local cmd = { bin_name, '--stdio'}

if vim.fn.has 'win32' == 1 then
    cmd = {'cmd.exe', '/C', bin_name, '--stdio'}
end

lsp.configure('nxls', {
    force_setup = true,
    cmd = cmd,
    filetypes = { 'json', 'jsonc'},
    root_dir = lsp_util.root_pattern('nx.json', '.git'),
    settings = {},
})

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = vim.schedule_wrap(function (fallback)
        if cmp.visible() and has_words_before() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
        else
            fallback()
        end
    end)
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    sources = {

        --- These are the default sources for lsp-zero
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'path'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function () vim.dianostics.open_float() end, opts)
    vim.keymap.set("n", "[d", function () vim.dianostics.goto_next() end, opts)
    vim.keymap.set("n", "]d", function () vim.dianostics.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
