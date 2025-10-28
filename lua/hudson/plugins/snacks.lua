return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            sources = {
                files = {
                    hidden = true,
                    exclude = {
                        "%.git/",
                        "%.data/",
                        "%.DS_Store",
                        "build/",
                        ".cache",
                        "assets",
                    },
                },
            },
        }
    },
    keys = {
        { "<leader>fs", function() Snacks.picker.smart() end,     desc = "Smart Find Files" },
        { "<leader>ff", function() Snacks.picker.files() end,     desc = "Find Files" },
        { "<leader>f/", function() Snacks.picker.grep() end,      desc = "Grep" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    priority = 5000,
    lazy = false,
}
