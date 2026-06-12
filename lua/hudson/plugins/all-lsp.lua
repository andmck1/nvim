return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--pch-storage=memory",
					"--compile-commands-dir=build",
					"--limit-results=50",
				},
				filetypes = { "cpp" },
			})

			vim.lsp.config("ruff", {
				settings = {},
			})
			vim.lsp.enable("ruff")
			vim.lsp.config("pyright", {
				setup = {
					settings = {
						pyright = {
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								ignore = { "*" },
							},
						},
					},
				},
			})
            vim.lsp.enable("gdscript");

			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-A>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {},
				dependencies = {
					{ "mason-org/mason.nvim", opts = {} },
					"neovim/nvim-lspconfig",
				},
			},
		},
	},
}
