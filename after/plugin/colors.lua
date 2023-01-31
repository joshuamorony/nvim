--local themes = { "gruvbox" }
local themes = { "vscode" }

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

function GruvboxMe(bg)
    bg = bg or "dark"
    vim.o.background = bg
    vim.cmd.colorscheme("gruvbox")
end

function VSCodeMe(bg)
    bg = bg or "dark"
    vim.o.background = bg
    local c = require("vscode.colors")
    require("vscode").setup({
        -- enable transparent background
        transparent = true,

        -- enable italic comment
        italic_comments = true,

        -- disable nvim-tree bg color
        disable_nvimtree_bg = true,

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
            -- this supports the same val table as vim.api.nvim_set_hl
            -- use colors from this colorscheme by requiring vscode.colors!
            Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        }
    })


    -- highlight current line number with SeaGreen
    vim.cmd [[ highlight CursorLineNr guifg='SeaGreen' guibg=none ]]
end

function ThemeMe(theme, scheme)
    theme = theme or themes[math.random(#themes)]
    scheme = scheme or "dark"
    if theme == "vscode" then
        VSCodeMe(scheme)
    elseif theme == "gruvbox" then
        GruvboxMe(scheme)
    else
        vim.cmd.colorscheme(theme)
    end
end

ThemeMe()
