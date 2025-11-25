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
                        "__pycache__",
                        ".ipynb_checkpoints",
                        "mlruns",
                        "dist"
                    },
                },
            },
        },
        lazygit = {},
        gitbrowse = {},
    },
    keys = {
        { "<leader>fs", function() Snacks.picker.smart() end,     desc = "Smart Find Files" },
        { "<leader>ff", function() Snacks.picker.files() end,     desc = "Find Files" },
        { "<leader>f/", function() Snacks.picker.grep() end,      desc = "Grep" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>gg", function() Snacks.lazygit.open() end,     desc = "Open Lazygit" },
        { "<leader>gb", function() Snacks.gitbrowse.open() end,   desc = "Open File in Github" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,  desc = "Open Git Diff of File" }
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-treesitter/nvim-treesitter"
    },
    priority = 5000,
    lazy = false,
}
