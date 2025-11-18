return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
        require 'nvim-treesitter.install'.prefer_git = false
        require 'nvim-treesitter.install'.compilers = { 'clang' }
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'python' },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end
}
