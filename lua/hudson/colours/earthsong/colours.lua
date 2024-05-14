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

    background = "#000000"
}

local M = {}

-- eg. function, class = green
-- eg. names = white
-- eg. comments = bright black
-- eg .play = blue
-- eg properties = yellow
-- eg typing = cyan

-- TODO
-- comments: doesn't work for block comment
-- separate comment and lint error?
-- separate out instatiation from def, init?.
-- add class to def, __init__, etc
-- not all lsp and ruff errors coloured red
-- change function colour
-- change string colour
-- separate out variables and function with no brackets
-- separate out __init__ from def
-- find bracket hilighting
-- make block border for line width show red - currently background colour
---@class Palette
M.default = {
  none = "NONE",
  bg_dark = colours.bright_black, -- eg nvim input line
  bg = colours.background, -- editor background
  bg_highlight = colours.white, -- unclear
  terminal_black = colours.white, -- unclear
  fg = colours.bright_white, -- variables
  fg_dark = colours.white, -- brackets
  fg_gutter = colours.bright_black, -- line numbers
  dark3 = colours.white, -- unclear
  comment = colours.white, -- comment and lint warning
  dark5 = colours.white, -- unclear
  blue0 = colours.white, -- unclear
  blue = colours.cyan, -- function definition and call
  cyan = colours.white, -- unclear
  blue1 = colours.cyan,  -- functions
  blue2 = colours.white, -- unclear
  blue5 = colours.white, -- eg operators, "in", :
  blue6 = colours.blue, -- unclear
  blue7 = colours.blue, -- unclear
  magenta = colours.green, -- def, __init__, for, if, white and instatiation
  magenta2 = colours.white, -- unclear
  purple = colours.green, -- class, return
  orange = colours.green, -- numbers
  yellow = colours.white, -- block comment, properties
  green = colours.bright_blue, -- strings
  green1 = colours.blue, -- accessing properties (eg. self.board)
  green2 = colours.white, -- unclear
  teal = colours.bright_yellow, -- lsp warnings
  red = colours.yellow, -- eg. self
  red1 = colours.bright_red, -- errors
  git = {
      change = colours.white,
      add = colours.bright_yellow,
      delete = colours.bright_red
  },
  gitSigns = {
    add = colours.bright_blue,
    change = colours.bright_yellow,
    delete = colours.bright_red,
  },
}

---@return ColorScheme
function M.setup(opts)
    opts = opts or {}
    local config = require("hudson.colours.earthsong.config")

    -- Color Palette
    ---@class ColorScheme: Palette
    local colors = M.default

    util.bg = colors.bg

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

    return colors
end

return M
