return {


    {
        "hardhackerlabs/theme-vim",
        name = "hardhacker",
        lazy = false,
        priority = 3000,
        config = function()
            -- local opts = {
            --   transparent = false,
            --   style = {
            --     "dark",
            --     "darker"
            --   }
            -- }

            -- custom highlights
            -- vim.g.hardhacker_custom_highlights = {}
            -- opts.style == "darker" then
            --   vim.g.hardhacker_darker = 1
            -- else
            -- end

            -- vim.g.hardhacker_hide_tilde = 1
            vim.g.hardhacker_keyword_italic = 1
            vim.g.hardhacker_darker = 1
            vim.cmd.colorscheme("hardhacker")
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 3000,
        config = function()
            vim.g.catppuccin_flavour = "mocha"
            vim.cmd.colorscheme("catppuccin")
        end
    },

    {
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        priority = 3000,

        config = function()
            local opts = {}

            opts.style = "cool"
            opts.transparent = true
            opts.transparent_sidebar = false
            require("onedark").setup(opts)

            require("onedark").load()
            -- vim.cmd.colorscheme("onedark")
        end
    }
}
