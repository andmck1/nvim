return {
    "tpope/vim-rhubarb",
	config = function()
		vim.keymap.set("n", "<leader>gy", "<Cmd>.GBrowse!<CR>")
	end
}
