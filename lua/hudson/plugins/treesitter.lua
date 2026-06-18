return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
			hightlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
		require("nvim-treesitter.install").prefer_git = false
		require("nvim-treesitter.install").compilers = { "clang" }
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "python", "yaml", "gitignore", "hlsl", "gdscript"},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
