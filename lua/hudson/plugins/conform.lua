return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				gersemi = {
					append_args = {
						"--line-length",
						"80",
					},
				},
				stylua = {
					append_args = {
						"--column-width",
						"80",
					},
				},
			},
			formatters_by_ft = {
				cmake = { "gersemi" },
				lua = { "stylua" },
			},
		})
	end,
}
