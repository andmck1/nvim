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
				gdscript_formatter = {
					command = "gdscript-formatter",
					prepend_args = {
						"--max-line-length",
						80,
					},
				},
			},
			formatters_by_ft = {
				cmake = { "gersemi" },
				lua = { "stylua" },
				markdown = { "prettier" },
				gdscript = { "gdscript_formatter" },
			},
		})
	end,
}
