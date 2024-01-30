-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local HEIGHT_RATIO = 1 -- You can change this
local WIDTH_RATIO = 0.25 -- You can change this too

local sort_by_modification_time = function(nodes)
	-- Check if a node is in a 'notes' directory
	local is_in_notes_directory = function(node)
		for ancestor in string.gmatch(node.absolute_path, "[^/]+") do
			if ancestor == "notes" then
				return true
			end
		end
		return false
	end

	-- Get the modification time of a file
	local get_mod_time = function(node)
		local attributes = vim.loop.fs_stat(node.absolute_path)
		return attributes and attributes.mtime.sec or 0
	end

	-- Perform the sorting
	table.sort(nodes, function(a, b)
		-- Prioritize directories over files
		if a.type ~= b.type then
			return a.type == "directory"
		end

		-- Check if both nodes are in 'notes' directories and are not directories themselves
		if is_in_notes_directory(a) and is_in_notes_directory(b) and a.type ~= "directory" then
			return get_mod_time(a) > get_mod_time(b)
		end
		return a.name < b.name -- default sort by name
	end)
end

local api = require("nvim-tree.api")

require("nvim-tree").setup({
	sort_by = sort_by_modification_time,
	view = {
		side = "right",
		float = {
			enable = false,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	renderer = {
		group_empty = false,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	filters = {
		dotfiles = false,
	},
})
