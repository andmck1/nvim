return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>ha", mark.add_file)
        vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)

        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 10,
            }
        })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
}
