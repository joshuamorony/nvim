-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for easily changing a line to comment
    use "preservim/nerdcommenter"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- themes
    use { "ellisonleao/gruvbox.nvim" }
    use('Mofiqul/vscode.nvim')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- a fork of nvim-treesitter that fixes inline html
    use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })

    -- utilities
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('kdheepak/lazygit.nvim')

    -- lsp stuffs
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Useful status updates for LSP
            {'j-hui/fidget.nvim'},

            -- Additional lua configuration, makes nvim stuff amazing
            {'folke/neodev.nvim'},

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "MunifTanjim/eslint.nvim",
        "MunifTanjim/prettier.nvim",
      },
    })

    use {
        'nvim-tree/nvim-tree.lua',
        -- latest has a bug with FindFileToggle. Use this until that resolves
        commit = '16f2806d5968157fd6f76542c9ac358c684a3a03',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')
    use('norcalli/nvim-colorizer.lua')

    use("SmiteshP/nvim-gps")

    -- WhichKey
    use {
         "folke/which-key.nvim",
         event = "VimEnter",
    }

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
    }

    -- Status line
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")

end)

