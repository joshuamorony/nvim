local map = vim.api.nvim_set_keymap;

-- center cursor after jumping
map("n", "<C-d>", "<C-d>zz", {noremap=true, silent=false})
map("n", "<C-u>", "<C-u>zz", {noremap=true, silent=false})

if vim.g.vscode then

else
	require("plugins")
	require("settings")
	require("transparent")
end


-- call plug#begin()
-- Plug 'patstockwell/vim-monokai-tasty'
-- Plug 'HerringtonDarkholme/yats.vim'
-- Plug 'pangloss/vim-javascript'
-- Plug 'MaxMEllon/vim-jsx-pretty'
-- Plug 'styled-components/vim-styled-components'
-- Plug 'elzr/vim-json'
-- Plug 'jparise/vim-graphql'
-- call plug#end()


