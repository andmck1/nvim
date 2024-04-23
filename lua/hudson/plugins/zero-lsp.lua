return {
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})
			end)
			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,

                    ruff_lsp = function()
                        require("lspconfig").ruff_lsp.setup({
                            on_attach = function(client, bufnr)
                                if client.name == "ruff_lsp" then
                                    client.server_capabilities.hoverProvider = false
                                end
                            end
                        })
                    end,

                    pyright = function()
                        require("lspconfig").pyright.setup({
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
                        })
                    end
				},
			})

		end,
	},
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
}

