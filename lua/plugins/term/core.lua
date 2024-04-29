return {
    {
        "voldikss/vim-floaterm",
        lazy = true,
        priority = 2000,
        config = function()
            -- configure this neovim lazy config for the vim-floaterm plugin
            require("voldikss/vim-floaterm").setup({})
        end
    }
}
