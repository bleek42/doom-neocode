return {

    {
        "snacks.nvim",
        event = "VimEnter",
        lazy = false,
        priority = 2000,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },

        ---@type snacks.Config
        opts = {

            -- local opts = {}
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

            -- local doomHeader =
            -- local builtin = require("nnn").builtin

            -- local file_explorer_cmds = {

            -- },
            -- local function file_explorer()
            --     return vim.fn.executable('nnn') and "NnnExplorer" or
            --         vim.fn.executable('ranger') and 'Ranger' or
            --         vim.fn.executable('lf') and 'Lf' or 'Telescope'
            -- end
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = false }, -- we set this in options.lua
            toggle = { map = LazyVim.safe_keymap_set },
            words = { enabled = true },

            dashboard = {
                enabled = true,
                width = 80,
                row = nil,    -- dashboard position. nil for center
                col = nil,    -- dashboard position. nil for center
                pane_gap = 1, -- empty columns between vertical panes
                -- autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
                -- These settings are used by some built-in sections
                preset = {
                    header = {
                        [[=================     ===============     ===============   ========  ========]],
                        [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
                        [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
                        [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
                        [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
                        [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
                        [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
                        [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
                        [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
                        [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
                        [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
                        [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
                        [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
                        [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
                        [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
                        [[||.=='    _-'                                                     `' |  /==.||]],
                        [[=='    _-'                        N E O V I M                         \/   `==]],
                        [[\   _-'                                                                `-_   /]],
                        [[ `''                                                                      ``' ]],
                    },

                    ---@type snacks.dashboard.Item[]
                    -- keys = {
                    --     { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    --     { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    --     { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    --     { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    --     { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    --     { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    --     { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                    --     { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    --     { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    -- },
                },

                -- item field formatters
                formats = {
                    icon = function(item)
                        if item.file and item.icon == "file" or item.icon == "directory" then
                            return M.icon(item.file, item.icon)
                        end
                        return { item.icon, width = 2, hl = "icon" }
                    end,
                    footer = { "%s", align = "center" },
                    header = { "%s", align = "center" },
                    file = function(item, ctx)
                        local fname = vim.fn.fnamemodify(item.file, ":~")
                        fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                        if #fname > ctx.width then
                            local dir = vim.fn.fnamemodify(fname, ":h")
                            local file = vim.fn.fnamemodify(fname, ":t")
                            if dir and file then
                                file = file:sub(-(ctx.width - #dir - 2))
                                fname = dir .. "/…" .. file
                            end
                        end
                        local dir, file = fname:match("^(.*)/(.+)$")
                        return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or
                            { { fname, hl = "file" } }
                    end,
                },

                sections = {
                    { section = "header", height = 120, width = 100 },
                    -- { section = "keys",   gap = 1,      padding = 1 },
                    { section = "startup" },
                },
            }

            -- opts.dashboard.preset = {}

            -- opts.config.center = {

            --     {
            --         key = "e",
            --         icon = " ",
            --         desc = "File Explorer",
            --         action = "Lf"
            --     },

            --     {
            --         key = "f",
            --         icon = " ",
            --         desc = "Find file",
            --         action = "FzfLua",
            --     },

            --     {
            --         key = "r",
            --         icon = " ",
            --         desc = " Recent files",
            --         action = "Telescope oldfiles"
            --     },

            --     -- { keymap = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
            --     {
            --         key = "n",
            --         icon = " ",
            --         desc = "New file",
            --         action = "ene | startinsert",
            --     },

            --     {
            --         key = "c",
            --         desc = "Config",
            --         icon = " ",
            --         action = "LazyConfig"
            --     },

            --     {
            --         key = "s",
            --         icon = " ",
            --         desc = " Restore Session",
            --         action = [[lua require("persistence").load()]]
            --     },

            --     {
            --         key = "x",
            --         icon = " ",
            --         desc = " Lazy Extras",
            --         action = "LazyExtras"
            --     },

            --     {
            --         key = "l",
            --         icon = "󰒲 ",
            --         desc = " Lazy",
            --         keymap = "Lazy"
            --     },

            --     {
            --         key = "Q",
            --         icon = " ",
            --         desc = "Quit",
            --         keymap = "qall"
            --     }
            -- }



            -- opts.config.footer = function()
            --     local stats = require("lazy").stats()
            --     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            --     return { "(( ⚡ Neovim loaded " ..
            --     stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms ))" }
            -- end

            -- for _, button in ipairs(opts.config.center) do
            --     button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            --     button.key_format = "  %s"
            -- end

            -- -- open dashboard after closing lazy
            -- if vim.o.filetype == "lazy" then
            --     vim.api.nvim_create_autocmd("WinClosed", {
            --         pattern = tostring(vim.api.nvim_get_current_win()),
            --         once = true,
            --         callback = function()
            --             vim.schedule(function()
            --                 vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            --             end)
            --         end,
            --     })
            -- end


        }
    }

}
