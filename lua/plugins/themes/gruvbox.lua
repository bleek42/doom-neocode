return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = true,
        event = 'VeryLazy',

        opts = function()
            vim.o.background = "dark"
        end,

        config = function(_, opts)
            vim.cmd("colorscheme gruvbox")
        end
    }
}
