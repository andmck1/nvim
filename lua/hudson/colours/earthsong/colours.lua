local util = require("hudson.colours.earthsong.util")

local colours = {
    black = '#121418',
    red = '#C94234',
    green = '#85C54C',
    yellow = '#F5AE2E',
    blue = '#1398B9',
    magenta = '#D0633D',
    cyan = '#509552',
    white = '#E5C6AA',

    bright_black = '#675F54',
    bright_red = '#FF645A',
    bright_green = '#98E036',
    bright_yellow = '#E0D561',
    bright_blue = '#5FDAFF',
    bright_magenta = '#FF9269',
    bright_cyan = '#84F088',
    bright_white = '#F6F7EC',
}

local M = {}

---@class Palette
M.default = {
  none = "NONE",
  bg_dark = colours.black,
  bg = colours.black,
  bg_highlight = colours.bright_black,
  terminal_black = colours.black,
  fg = colours.bright_white,
  fg_dark = colours.bright_white,
  fg_gutter = colours.bright_black,
  dark3 = colours.bright_black,
  comment = colours.white,
  dark5 = colours.blue,
  blue0 = colours.blue,
  blue = colours.bright_blue,
  cyan = colours.cyan,
  blue1 = colours.bright_blue,
  blue2 = colours.bright_blue,
  blue5 = colours.bright_blue,
  blue6 = colours.bright_blue,
  blue7 = colours.blue,
  magenta = colours.magenta,
  magenta2 = colours.bright_magenta,
  purple = colours.magenta,
  orange = colours.yellow,
  yellow = colours.bright_yellow,
  green = colours.green,
  green1 = colours.bright_green,
  green2 = colours.bright_green,
  teal = colours.bright_magenta,
  red = colours.red,
  red1 = colours.bright_red,
  git = { change = colours.blue, add = colours.cyan, delete = colours.red },
  gitSigns = {
    add = colours.green,
    change = colours.yellow,
    delete = colours.red,
  },
}

M.night = {
    bg = colours.black,
    bg_dark = colours.black
}
M.day = M.night

M.moon = function()
    local ret = {
        none = "NONE",
        bg_dark = "#1e2030",    --
        bg = "#222436",         --
        bg_highlight = "#2f334d", --
        terminal_black = "#444a73", --
        fg = "#c8d3f5",         --
        fg_dark = "#828bb8",    --
        fg_gutter = "#3b4261",
        dark3 = "#545c7e",
        comment = "#7a88cf", --
        dark5 = "#737aa2",
        blue0 = "#3e68d7", --
        blue = "#82aaff", --
        cyan = "#86e1fc", --
        blue1 = "#65bcff", --
        blue2 = "#0db9d7",
        blue5 = "#89ddff",
        blue6 = "#b4f9f8", --
        blue7 = "#394b70",
        purple = "#fca7ea", --
        magenta2 = "#ff007c",
        magenta = "#c099ff", --
        orange = "#ff966c", --
        yellow = "#ffc777", --
        green = "#c3e88d", --
        green1 = "#4fd6be", --
        green2 = "#41a6b5",
        teal = "#4fd6be", --
        red = "#ff757f", --
        red1 = "#c53b53", --
    }
    ret.comment = util.blend(ret.comment, ret.bg, "bb")
    ret.git = {
        change = util.blend(ret.blue, ret.bg, "ee"),
        add = util.blend(ret.green, ret.bg, "ee"),
        delete = util.blend(ret.red, ret.bg, "dd"),
    }
    ret.gitSigns = {
        change = util.blend(ret.blue, ret.bg, "66"),
        add = util.blend(ret.green, ret.bg, "66"),
        delete = util.blend(ret.red, ret.bg, "aa"),
    }
    return ret
end

---@return ColorScheme
function M.setup(opts)
    opts = opts or {}
    local config = require("hudson.colours.earthsong.config")

    local style = config.is_day() and config.options.light_style or config.options.style
    local palette = M[style] or {}
    if type(palette) == "function" then
        palette = palette()
    end

    -- Color Palette
    ---@class ColorScheme: Palette
    local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

    util.bg = colors.bg
    util.day_brightness = config.options.day_brightness

    colors.diff = {
        add = util.darken(colors.green2, 0.15),
        delete = util.darken(colors.red1, 0.15),
        change = util.darken(colors.blue7, 0.15),
        text = colors.blue7,
    }

    colors.git.ignore = colors.dark3
    colors.black = util.darken(colors.bg, 0.8, "#000000")
    colors.border_highlight = util.darken(colors.blue1, 0.8)
    colors.border = colors.black

    -- Popups and statusline always get a dark background
    colors.bg_popup = colors.bg_dark
    colors.bg_statusline = colors.bg_dark

    -- Sidebar and Floats are configurable
    colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
        or config.options.styles.sidebars == "dark" and colors.bg_dark
        or colors.bg

    colors.bg_float = config.options.styles.floats == "transparent" and colors.none
        or config.options.styles.floats == "dark" and colors.bg_dark
        or colors.bg

    colors.bg_visual = util.darken(colors.blue0, 0.4)
    colors.bg_search = colors.blue0
    colors.fg_sidebar = colors.fg_dark
    -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
    colors.fg_float = colors.fg

    colors.error = colors.red1
    colors.todo = colors.blue
    colors.warning = colors.yellow
    colors.info = colors.blue2
    colors.hint = colors.teal

    colors.delta = {
        add = util.darken(colors.green2, 0.45),
        delete = util.darken(colors.red1, 0.45),
    }

    config.options.on_colors(colors)
    if opts.transform and config.is_day() then
        util.invert_colors(colors)
    end

    return colors
end

return M
