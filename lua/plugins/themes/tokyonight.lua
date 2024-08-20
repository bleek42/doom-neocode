return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        priority = 4000,

        config = function()
            local opts = {}
            opts.style = "storm"
            opts.transparent = false
            require("tokyonight").setup()

            vim.cmd.colorscheme("tokyonight")
        end
    }
}
