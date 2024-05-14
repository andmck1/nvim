local util = require("hudson.colours.modus.util")
local theme = require("hudson.colours.modus.theme")
local config = require("hudson.colours.modus.config")

local M = {}

---@param opts Config|nil
function M.load(opts)
	util.load(theme.setup())
end

M.setup = config.setup

return M
