return {
    "stevearc/oil.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local hidden_names = {
            [".git"] = true,
            [".ipynb_checkpoints"] = true,
            ["__pycache__"] = true,
        }

        require("oil").setup({
            default_file_explorer = true,

            delete_to_trash = false,

            skip_confirm_for_simple_edits = true,

            view_options = {
                show_hidden = false,

                is_hidden_file = function(name, _)
                    return hidden_names[name] == true
                        or name:match("%.gd%.uid$") ~= nil
                end,
            },

            win_options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
                wrap = false,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end,
}
