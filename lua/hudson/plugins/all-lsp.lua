return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            local lspconfig_defaults = require('lspconfig').util.default_config

            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('blink.cmp').get_lsp_capabilities({}, false)
            )

            local on_attach = function(client, _)
                if client.name == 'ruff' then
                    client.server_capabilities.hoverProvider = false
                end
            end
            lspconfig.ruff.setup({
                on_attach = on_attach,
            })
            lspconfig.pyright.setup({
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                    },
                },
            })
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "ruff",
                    "pyright",
                    "lua_ls",
                    "bashls",
                    "yamlls",
                    "texlab",
                    "clangd",
                    "terraformls",
                },
                handlers = {
                    function(server_name)
                        local capabilities = require('blink.cmp').get_lsp_capabilities()
                        lspconfig[server_name].setup({ capabilities = capabilities })
                    end,
                    ["yamlls"] = function()
                        lspconfig.yamlls.setup {
                            settings = {
                                yaml = {
                                    format = {
                                        enable = true
                                    },
                                    schemaStore = {
                                        enable = true
                                    }
                                }
                            }
                        }
                    end,
                    ["terraformls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.terraformls.setup {
                            filetypes = {
                                "terraform", "terraform-vars"
                            }
                        }
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = {
                                            "vim"
                                        }
                                    }
                                }
                            }
                        }
                    end,
                },
            })

            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
}
