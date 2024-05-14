local util = require("hudson.colours.earthsong.util")
local theme = require("hudson.colours.earthsong.theme")
local config = require("hudson.colours.earthsong.config")

local M = {}

function M.load()
  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
