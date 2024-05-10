return {
	{
		"shaunsingh/doom-vibrant.nvim",
		lazy = false,
		priority = 50,
		config = function()
            vim.g.doom_disable_background = true
            require("doom").set()
		end
	},
}
