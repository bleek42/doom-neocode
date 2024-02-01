return {

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        lazy = false,
        priority = 9000,
        dependencies = {
            "hardhackerlabs/theme-vim",
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            -- local neovimHeader = [[
            --       ⠀⠀⠀⣠⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ⠀⣴⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣶⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢹⣀⠶⠋⠉⠙⢿⣄⠀⠀⣠⡾⠋⠉⠉⠛⣦⠀⠀⣠⡾⠛⠉⠉⠛⣶⡀⠙⣿⣿⠀⠀⠀⠀⣿⣿⡟⢸⣿⣿⠀⢸⣿⣿⣿⠿⠿⣿⣿⣶⣿⠿⢿⣿⣿⡄
            --       ⣿⣿⣿⣿⣿⠙⣿⣿⣿⣿⣿⣆⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⣿⠀⢸⣏⣀⣀⣀⣀⣀⣈⡇⢰⡟⠀⠀⠀⠀⠀⠀⣿⡀⠹⣿⣿⠀⠀⣾⣿⡟⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⣿⣿⣿
            --       ⣿⣿⣿⣿⣿⠀⠈⢿⣿⣿⣿⣿⣷⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⣿⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⣿⡇⠀⢻⣿⣷⣰⣿⡿⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⣿⣿⣿
            --       ⣿⣿⣿⣿⣿⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⣿⠀⠈⣿⡀⠀⠀⠀⠀⠀⠀⠈⣿⡀⠀⠀⠀⠀⣠⡿⠀⠀⠀⢿⣿⣿⣿⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⣿⣿⣿
            --       ⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀⠀⠀⠛⠀⠀⠀⠉⠛⠛⠛⠋⠁⠀⠀⠀⠉⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠈⠛⠛⠀⠈⠛⠛⠀⠀⠀⠘⠛⠛⠀⠀⠀⠙⠛⠋
            --       ⠙⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ⠀⠀⠈⢿⣿⠀⠀⠀⠀⠀⠀⠀⠉⣿⣿⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            --       ]]

            -- local builtin = require("nnn").builtin

            local opts = {
                theme = "hardhacker",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },

                config = {
                    header = {
                        "                                                                              ",
                        "=================     ===============     ===============   ========  ========",
                        "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
                        "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
                        "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                        "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                        "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
                        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
                        "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
                        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
                        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
                        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
                        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
                        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
                        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
                        "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
                        "||.=='    _-'                                                     `' |  /==.||",
                        "=='    _-'                    {{ L A Z Y V I M }}                       \\/   `==",
                        "\\   _-'                                                                `-_   /",
                        " `''                                                                      ``'  ",
                    },

                    center = {
                        {
                            desc = "Launch Nnn Explorer",
                            keymap = "SPC N e",
                            action = "NnnExplorer",
                            icon = " ",
                        },

                        {
                            desc = "Launch Nnn Picker",
                            keymap = "SPC N p",
                            action = "NnnPicker",
                            icon = " ",
                        },


                        {
                            desc = "Last Nnn session",
                            keymap = "SPC N s",
                            icon = "  ",
                        },

                        {
                            icon = "  ",
                            desc = "Recent files",
                            action = "Telescope oldfiles",
                            keymap = "SPC f r"
                        },

                        {
                            icon = "  ",
                            desc = "Find File",
                            action = "Telescope find_files",
                            keymap = "SPC f f"
                        },

                        {
                            icon = "  ",
                            desc = "Find word",
                            action = "Telescope live_grep",
                            keymap = "SPC f g"
                        },

                        {
                            desc = "Quit",
                            keymap = "qa",
                            icon = " ",
                        },
                        -- { keymap = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
                        -- { keymap = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
                        -- { keymap = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
                        -- { keymap = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
                        -- { keymap = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
                        -- { keymap = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
                        -- { keymap = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
                        -- { keymap = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
                    },

                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "(( ⚡ Neovim loaded " ..
                        stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms ))" }
                    end,
                },
            }

            require("dashboard").setup(opts)
        end,
    },
}
