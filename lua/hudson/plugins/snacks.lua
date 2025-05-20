return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            files = {
                hidden = true,
                exclude = "%.git/",
                "%.data/",
                "%.DS_Store"
            }
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
    }
}
