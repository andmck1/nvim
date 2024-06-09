return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require('dap')
            dap.configurations.cpp = {
                {
                    name = "nvim c++",
                    type = "codelldb",
                    request = "launch",
                    program = "${workspaceFolder}/main",
                },
            }
            vim.keymap.set(
                "n",
                "<leader>db",
                "<cmd> DapToggleBreakpoint <CR>"
            )
            vim.keymap.set(
                "n",
                "<leader>dr",
                "<cmd> DapContinue <CR>"
            )
        end
    }
}
