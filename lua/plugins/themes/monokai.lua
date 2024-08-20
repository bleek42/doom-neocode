return {
    {
        "tanvirtin/monokai.nvim",
        name = "monokai",
        config = function()
            require("monokai").setup({})
            vim.cmd.colorscheme("monokai")
        end
    }
}
