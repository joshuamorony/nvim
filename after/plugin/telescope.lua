local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

--local function telescope_buffer_dir()
--  return vim.fn.expand('%:p:h')
--end
--
--local fb_actions = require "telescope".extensions.file_browser.actions
--
--telescope.setup {
--    defaults = {
--        mappings = {
--            n = {
--                ["q"] = actions.close
--            }
--        }
--    },
--    extensions = {
--        file_browser = {
--            theme = "dropdown",
--            -- disables netrw and use telescope-file-browser
--            hijack_netrw = true,
--            mappings = {
--                ["i"] = {},
--                ["n"] = {}
--            }
--        }
--    }
--}
--
--telescope.load_extension("file_browser");

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
--vim.keymap.set("n", "<leader>pvf", function()
--  telescope.extensions.file_browser.file_browser({
--    path = "%:p:h",
--    cwd = telescope_buffer_dir(),
--    respect_gitignore = false,
--    hidden = true,
--    grouped = true,
--    previewer = false,
--    initial_mode = "normal",
--    layout_config = { height = 40 }
--  })
--end)
