return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				require("nvim-treesitter.install").update({ with_sync = true })()
			end
		},
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			config = function()
				require'nvim-treesitter.configs'.setup {
					ensure_installed = {
                        "c", "lua", "vim", "vimdoc", "query", "javascript",
                        "typescript", "python", "terraform", "yaml"
                    },

                    sync_install = true,

					auto_install = true,

					highlight = {
						enable = true,
					},
				}
			end
	    }
    },
    config = function()
        local telescope = require("telescope")
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	    vim.keymap.set("n", "<leader>ps",
	    function()
		    builtin.grep_string({ search = vim.fn.input("Grep > ") });
	    end)

        telescope.setup {
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            defaults = {
                file_ignore_patterns = {
                    ".git/", ".data", ".DS_Store"
                }
            }
        }
    end

}
