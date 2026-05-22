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
				prettier = {
					prepend_args = {
						"--print-width",
						"80",
						"--prose-wrap",
						"always",
					},
				},
			},
			formatters_by_ft = {
				cmake = { "gersemi" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
		})
	end,
}
