local lsp = require('lsp-zero')
local lsp_util = require('lspconfig.util');

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'angularls',
    'html',
    'cssls',
    'jsonls',
    'lua_ls',
    'tailwindcss',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- lsp.configure('denols', {
    -- root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
-- })

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

-- Set up nvim-cmp.
local cmp = require("cmp")
cmp.setup({
  enabled = function()
    if require("cmp.config.context").in_treesitter_capture("comment") == true
        or require("cmp.config.context").in_syntax_group("Comment")
        or vim.api.nvim_buf_get_option(0, "filetype") == "TelescopePrompt"
    then
      return false
    else
      return true
    end
  end,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
