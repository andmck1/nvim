return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        keys = {
            { "<leader>zc", ":CopilotChat<CR>",         mode = "n", desc = "Chat with Copilot" },
            { "<leader>ze", ":CopilotChat Explain<CR>",  mode = "v", desc = "Explain Code" },
            { "<leader>zr", ":CopilotChat Review<CR>",   mode = "v", desc = "Review Code" },
            { "<leader>zf", ":CopilotChat Fix<CR>",      mode = "v", desc = "Fix Code" },
            { "<leader>zo", ":CopilotChat Optimize<CR>", mode = "v", desc = "Optimise Code" },
        },
    }
}
