return {
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			local lsp_zero = require('lsp-zero')
            local cmp = require("cmp")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            cmp.setup({
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-u>'] = lsp_zero.cmp_action().toggle_completion(),
                    ['<Tab>'] = cmp.mapping.confirm({select = true}),
                }
            })
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.format)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {"ruff_lsp", "pyright", "lua_ls", "bashls", "yamlls"},
				handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })

		end,
	},
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
}

