local util = require("hudson.colours.earthsong.util")
local theme = require("hudson.colours.earthsong.theme")
local config = require("hudson.colours.earthsong.config")

local M = {}

function M._load(style)
  if style and not M._style then
    M._style = require("hudson.colours.earthsong.config").options.style
  end
  if not style and M._style then
    require("hudson.colours.earthsong.config").options.style = M._style
    M._style = nil
  end
  M.load({ style = style, use_background = style == nil })
end

---@param opts Config|nil
function M.load(opts)
  if opts then
    require("hudson.colours.earthsong.config").extend(opts)
  end
  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
