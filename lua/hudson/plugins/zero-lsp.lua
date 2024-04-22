return {
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			local lsp_zero = require('lsp-zero')
            local lsp_config = require("lspconfig")

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})
			end)

            lsp_config.pyright.setup({
                  settings = {
                      pyright = {
                          disableOrganizeImports = true,
                      },
                      python = {
                          analysis = {
                              ignore = { '*' },
                          },
                      },
                  },
            })
            lsp_config.ruff.setup({})
            lsp_config.terraformls.setup({})
        end,
        dependencies = {
            'neovim/nvim-lspconfig', 
        },
        build = [[
        pip install ruff &&
        pip install pyright
        ]]
        

	},
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
}

