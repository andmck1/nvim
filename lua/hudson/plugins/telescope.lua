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
					-- A list of parser names, or "all" (the five listed parsers should always be installed)
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "terraform" },

					-- Install parsers synchronously (only applied to `ensure_installed`)
				    	sync_install = false,

					-- Automatically install missing parsers when entering buffer
					-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
					auto_install = true,

					highlight = {
						enable = true,

						additional_vim_regex_highlighting = false,
					},
				}
			end
	    }
    },
    config = function()
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	    vim.keymap.set("n", "<leader>ps",
	    function()
		    builtin.grep_string({ search = vim.fn.input("Grep > ") });
	    end)
    end

}
