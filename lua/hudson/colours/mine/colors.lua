-- Basic rules for colors:
-- Regular text must have a contrast ratio of at least 7:1
-- Large and bold text must have a contrast ratio of at least 4.5:1
-- Non-text elements and state object (mouseover, focused, selected) must have a
-- contrast ratio of at least 3:1

local M = {}
---@class Palette
M.earthsong = {
    none = "NONE",

    -- Base values
    bg_main = "#121418",
    bg_dim = "#292520",
    bg_alt = "#1e1e1e",
    fg_main = "#E5C7A9",
    fg_dim = "#675F54",
    fg_alt = "#E5C6AA",
    border = "#61647a",

    -- Common foreground values
    red = "#C94234",
    green = "#85C54C",
    yellow = "#F5AE2E",
    blue = "#1398B9",
    magenta = "#D0633D",
    cyan = "#509552",

    -- These foreground values can only be used for non-text elements with a 3:1
    -- contrast ratio. Combine with bg_main, bg_dim, bg_alt
    red_intense = "#FF645A",
    green_intense = "#98E036",
    yellow_intense = "#E0D561",
    blue_intense = "#5FDAFF",
    magenta_intense = "#FF9269",
    cyan_intense = "#84F088",

    -- Subtle should be combined with fg_dim, fg_alt, fg_main
    bg_red_subtle = "#5FDAFF",
    bg_green_subtle = "#98E036",
    bg_yellow_subtle = "#E0D561",
    bg_blue_subtle = "#5FDAFF",
    bg_magenta_subtle = "#FF9269",
    bg_cyan_subtle = "#84F088",
}

---@return ColorScheme
function M.setup(opts)
	opts = opts or {}
	local config = require("hudson.colours.mine.config")

	-- local style = config.is_light() and "modus_operandi" or "modus_vivendi"
    local style = "earthsong"
	-- Color Palette
	---@class ColorScheme: Palette
	local colors = M[style]

	colors.cursor = colors.fg_main
	colors.comment = colors.fg_dim
	colors.error = colors.red_cooler
	colors.warning = colors.yellow_cooler
	colors.info = colors.blue_cooler
	colors.hint = colors.cyan_cooler
	colors.visual = colors.bg_magenta_intense
	colors.accent_light = colors.blue_faint
	colors.accent = colors.blue_warmer
	colors.accent_darker = colors.blue
	colors.accent_dark = colors.blue_intense
	config.options.on_colors(colors)

	return colors
end

return M
