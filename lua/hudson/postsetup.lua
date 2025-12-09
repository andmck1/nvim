-- colourscheme
vim.cmd("colorscheme kanagawa")
vim.cmd("highlight NonText guifg=white")
vim.cmd("highlight Normal guibg=black guifg=white")
vim.cmd("highlight LineNr guibg=black guifg=white")
vim.cmd("highlight SignColumn guibg=black guifg=white")
vim.cmd("highlight ColorColumn guibg=DarkRed")

-- filetypes
vim.filetype.add({
    extension = { hlsl = "hlsl" } })
