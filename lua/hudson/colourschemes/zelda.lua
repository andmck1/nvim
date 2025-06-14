local theme = {}

-- Define palette
local colors = {
    hyrule_green   = "#4FA64F", -- identifiers, strings
    master_blue    = "#3D6FA5", -- functions, methods
    darkworld_purp = "#6C3D8F", -- keywords, loops
    rupee_gold     = "#E6C35C", -- constants, numbers
    heart_red      = "#D94F4F", -- errors, warnings
    bottle_aqua    = "#6FC3C3", -- types, classes
    dungeon_gray   = "#3F3F3F", -- background
    menu_cream     = "#F0E7C5", -- foreground
    shadow_black   = "#1C1C1C"  -- cursor line, visual select
}

-- Apply theme highlights
theme.setup = function()
    local hl = vim.api.nvim_set_hl
    local NONE = "NONE"

    -- Editor
    hl(0, "Normal", { fg = colors.menu_cream, bg = colors.dungeon_gray })
    hl(0, "CursorLine", { bg = colors.shadow_black })
    hl(0, "Visual", { bg = colors.shadow_black })
    hl(0, "LineNr", { fg = colors.bottle_aqua })
    hl(0, "CursorLineNr", { fg = colors.rupee_gold, bold = true })

    -- Syntax
    hl(0, "Comment", { fg = colors.bottle_aqua, italic = true })
    hl(0, "Constant", { fg = colors.rupee_gold })
    hl(0, "String", { fg = colors.hyrule_green })
    hl(0, "Identifier", { fg = colors.hyrule_green })
    hl(0, "Function", { fg = colors.master_blue })
    hl(0, "Statement", { fg = colors.darkworld_purp, bold = true })
    hl(0, "PreProc", { fg = colors.bottle_aqua })
    hl(0, "Type", { fg = colors.bottle_aqua })
    hl(0, "Special", { fg = colors.rupee_gold })
    hl(0, "Underlined", { fg = colors.master_blue, underline = true })

    -- Diagnostics
    hl(0, "Error", { fg = colors.heart_red, bold = true })
    hl(0, "WarningMsg", { fg = colors.heart_red })
    hl(0, "Todo", { fg = colors.rupee_gold, bg = colors.dungeon_gray, bold = true })

    -- Diff
    hl(0, "DiffAdd", { bg = colors.hyrule_green })
    hl(0, "DiffDelete", { bg = colors.heart_red })
    hl(0, "DiffChange", { bg = colors.master_blue })
    hl(0, "DiffText", { bg = colors.darkworld_purp })

    -- UI
    hl(0, "Pmenu", { fg = colors.menu_cream, bg = colors.shadow_black })
    hl(0, "PmenuSel", { fg = colors.menu_cream, bg = colors.master_blue })
    hl(0, "VertSplit", { fg = colors.dungeon_gray })
end

return theme
