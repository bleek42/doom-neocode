return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        opts = {
            style = "storm",
            transparent = false
        },

        config = function(_, opts)
            require("tokyonight").setup(opts)

            -- vim.cmd.colorscheme("tokyonight")
        end
    }
}
