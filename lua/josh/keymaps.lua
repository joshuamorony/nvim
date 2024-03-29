-- commands
vim.cmd([[command! W w]])

-- general
-- vim.keymap.set('n', '<c-l>', '<cmd>bnext<CR>', { desc = 'Next buffer'});
-- vim.keymap.set('n', '<c-h>', '<cmd>bprev<CR>', { desc = 'Prev buffer'});
vim.keymap.set("n", "<leader>w", "<c-w>")
vim.keymap.set("n", "U", "<c-u>zz")
vim.keymap.set("n", "D", "<c-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>cf", "0<c-g>", { desc = "Show full file path" })
vim.keymap.set("n", "Q", "<nop>")

-- quickfix
vim.keymap.set("n", "<leader>q", "<C-q>")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- changes
vim.keymap.set("n", "<C-k>", "g;zz")
vim.keymap.set("n", "<C-j>", "g,zz")

-- replace highlighted word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- move lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- join lines
vim.keymap.set("n", "J", "mzJ`z")

-- markdown
vim.keymap.set(
	"n",
	"<leader>da",
	'<cmd>setlocal formatoptions-=a<cr><cmd>setlocal textwidth=0<cr><cmd>echo "Auto-wrapping disabled"<cr>',
	{ desc = "Disable auto wrap" }
)
vim.keymap.set(
	"n",
	"<leader>ea",
	'<cmd>setlocal formatoptions+=a<cr><cmd>setlocal textwidth=80<cr><cmd>echo "Auto-wrapping enabled"<cr>',
	{ desc = "Enable auto wrap" }
)

vim.keymap.set("v", "<leader>mb", "di****<esc>hhp", { desc = "Auto bold" })
vim.keymap.set("v", "<leader>mi", "di**<esc>hp", { desc = "Auto italic" })
vim.keymap.set("v", "<leader>ml", "di[]()<esc>hhhpllli", { desc = "Auto link" })
vim.keymap.set("v", "<leader>mc", "di``<esc>hp", { desc = "Auto backtick" })

-- custom
vim.keymap.set(
	"n",
	"<leader>sp",
	"<cmd>lua require('josh.custom.angular').toggle_between_spec_and_file()<cr>",
	{ desc = "Toggle between spec and file" }
)
vim.keymap.set(
	"n",
	"<leader>sv",
	"<cmd>lua require('josh.custom.svelte').toggle_between_svelte_parts()<cr>",
	{ desc = "Toggle between .svelete and .ts" }
)
vim.keymap.set("n", "<leader>bw", "<cmd>bufdo bwipeout<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>-", "<cmd>rightbelow split <cr>")

vim.keymap.set("n", "<leader>\\", "<cmd>rightbelow vsplit <cr>")

-- aerial
require("aerial").setup({
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>x", "<cmd>AerialToggle!<CR>")

-- jesting
vim.keymap.set("n", "<leader>ja", vim.cmd.Jest)
vim.keymap.set("n", "<leader>jf", vim.cmd.JestFile)
vim.keymap.set("n", "<leader>js", vim.cmd.JestSingle)
vim.keymap.set("n", "<leader>jc", vim.cmd.JestCoverage)

-- lazygit
vim.keymap.set("n", "<leader>gs", vim.cmd.LazyGit)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hl", function()
	ui.nav_next()
end)
vim.keymap.set("n", "<leader>hh", function()
	ui.nav_next()
end)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- telescope
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>ss", require("telescope.builtin").git_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>jl", require("telescope.builtin").jumplist, { desc = "[J]ump [L]ist" })
vim.keymap.set("n", "<leader>km", require("telescope.builtin").keymaps, { desc = "[K]ey[M]aps" })
vim.keymap.set("n", "<leader>rg", require("telescope.builtin").registers, { desc = "[R]egisters" })
vim.keymap.set("n", "<leader>ht", require("telescope.builtin").help_tags, { desc = "[H]elp [T]ags" })

-- nx
vim.keymap.set("n", "<leader>ng", require("nx.generators").generators, { desc = "[N]x [G]enerators" })

-- lsp
require("lsp-zero").on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>k", function()
		vim.dianostics.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostics.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostics.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>.", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>r", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>fr", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>ff", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>fd", vim.cmd.NvimTreeCollapse)
vim.keymap.set("n", "<leader>fu", ":NvimTreeResize +10<cr>")
vim.keymap.set("n", "<leader>fi", ":NvimTreeResize -10<cr>")

-- jump list + buffer
function jumps_fileCO(direction)
	-- Default to jumping backward if no direction is specified
	direction = direction or "backward"

	local current_buffer = vim.fn.bufnr()
	local last_file = vim.fn.bufname()

	local jump_command = ""
	if direction == "backward" then
		jump_command = "normal! <c-o>"
	elseif direction == "forward" then
		jump_command = "normal! 1<c-i>"
	end

	while true do
		vim.cmd(vim.api.nvim_replace_termcodes(jump_command, true, true, true))
		if vim.fn.bufnr() == current_buffer then
			if vim.fn.bufname() == last_file then
				break
			else
				last_file = vim.fn.bufname()
			end
		else
			break
		end
	end
end

vim.keymap.set("n", "<c-l>", "<cmd>lua jumps_fileCO('forward')<cr>", { desc = "Next buffer in jump list" })
vim.keymap.set("n", "<c-h>", "<cmd>lua jumps_fileCO()<cr>", { desc = "Prev buffer in jump list" })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "<leader>FO", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "<leader>FC", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "<leader>fo", "<cmd>foldo<cr>", { desc = "Open [fo]ld" })
vim.keymap.set("n", "<leader>fc", "<cmd>foldc<cr>", { desc = "Close [fo]ld" })

-- source
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
vim.keymap.set("n", "<leader><leader>k", "<cmd>source ~/.config/nvim/lua/josh/keymaps.lua<CR>")
