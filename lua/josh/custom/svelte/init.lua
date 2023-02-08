local path = require("plenary.path")
local scan = require("plenary.scandir")

local M = {}
local max_depth = 5

local function load_file_into_buffer(file)
	local uri = vim.uri_from_fname(file)
	local new_buff = vim.uri_to_bufnr(uri)
	vim.api.nvim_win_set_buf(0, new_buff)
	vim.fn.execute("edit")
end

function M.toggle_between_svelte_parts()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	local buf_path = path:new(current_buffer)
	local relative_path = buf_path:make_relative()
	local filename = string.match(relative_path, "([^/]+)$")

	local full_destination = nil
	if string.match(filename, ".ts") then
		local file_name = string.match(filename, "(.-)%.ts")
		full_destination = buf_path:parent() .. "/" .. file_name .. ".svelte"
	else
		local file_name = string.match(filename, "(.-)%.svelte")
		full_destination = buf_path:parent() .. "/" .. file_name .. ".ts"
	end

	local exists = vim.fn.filereadable(full_destination)
	-- don't open a buffer if the file doesn't exist since you may end up creating a file without knowing it
	if exists == 0 then
		vim.notify("File doesn't exist: " .. full_destination, vim.log.levels.WARN)
		return
	end

	load_file_into_buffer(full_destination)
end

return M
