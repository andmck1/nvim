return {
	"nvim-tree/nvim-web-devicons",
	lazy = false,
	priority = 99999999,
	config = function()
		require("nvim-web-devicons").setup({
			override_by_extension = {
				slang = {
					icon = "",
                    color = "#fd6533",
					name = "Slang",
				},
				slangh = {
					icon = "",
                    color = "#fd6533",
					name = "Slang",
				},
			},
		})
	end,
}
