local util = require("hudson.colours.modus.util")
local theme = require("hudson.colours.modus.theme")
local config = require("hudson.colours.modus.config")

local M = {}

function M.load()
	util.load(theme.setup())
end

M.setup = config.setup

return M
