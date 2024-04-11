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
		    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	    }
    }
}
