-- vim.opt.guicursor = "a:block,i:blinkon10-blinkwait10"
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.opt.undodir = os.getenv("XDG_CONFIG_HOME") .. "\\.vim\\undodir"
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = 81"

vim.opt.mouse = ""

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set tabstop=4")

vim.cmd("autocmd TermOpen * startinsert")
