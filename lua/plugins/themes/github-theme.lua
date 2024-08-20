return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",

        config = function()
            -- opts.transparent = false
            require("github-theme").setup({})
            vim.cmd('colorscheme github_dark_tritanopia')
        end
    }
}
