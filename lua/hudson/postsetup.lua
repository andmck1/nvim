-- colourscheme
vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme tokyonight")
vim.cmd("highlight NonText guifg=white")
vim.cmd("highlight Normal guibg=black guifg=white")
vim.cmd("highlight LineNr guibg=black guifg=white")
vim.cmd("highlight SignColumn guibg=black guifg=white")
vim.cmd("highlight ColorColumn guibg=DarkRed")

-- filetypes
vim.filetype.add({
	extension = { hlsl = "hlsl" },
})
vim.filetype.add({
	filename = {
		["CMakeLists.txt"] = "cmake",
	},
})

vim.o.exrc = true

local links = {
	["@function.call"] = "Function",
	["@method.call"] = "Function",
	["@variable"] = "Identifier",
	["@variable.member"] = "Identifier",
	["@variable.builtin"] = "Special",
	["@keyword.return"] = "Keyword",
	["@keyword.operator"] = "Keyword",
	["@type.builtin"] = "Type",
	["@constant.builtin"] = "Constant",
	["@string.escape"] = "SpecialChar",
	["@punctuation.bracket"] = "Delimiter",
	["@punctuation.delimiter"] = "Delimiter",
}

for group, link in pairs(links) do
	vim.api.nvim_set_hl(0, group, { link = link, default = true })
end
