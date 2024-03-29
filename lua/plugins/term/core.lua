return {
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        config = function()
            require("toggglterm.nvim").setup({
                direction = 'horizontal',
                close_on_exit = true, -- close the terminal window when the process exits
                -- Change the default shell. Can be a string or a function returning a string
                shell = vim.o.shell,
                auto_scroll = true, -- automatically scroll to the bottom on terminal output
                -- This field is only relevant if direction is set to 'float'
                float_opts = {
                    -- The border key is *almost* the same as 'nvim_open_win'
                    -- see :h nvim_open_win for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    border = 'shadow', -- ... other options supported by win open
                    -- like `size`, width and height can be a number or function which is passed the current terminal
                    width = 18,
                    height = 20,
                    winblend = 3,
                    zindex = 50,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
                winbar = {
                    enabled = false,
                    name_formatter = function(term) --  term: Terminal
                        return term.name
                    end

                }
            })
        end
    }
}
