return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    enable = false
  },

  {
    "luukvbaal/nnn.nvim",
    lazy = false,
    -- event = "WinEnter",
    priority = 8000,
    cmd = {
      "NnnExplorer",
      "NnnPicker"
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local builtin = require("nnn").builtin

      require("nnn").setup({
        explorer = {
          cmd = "nnn -xCH",  -- command override (-F1 flag is implied, -a flag is invalid!)
          width = 28,        -- width of the vertical split
          side = "topleft",  -- or "botright", location of the explorer window
          session = "local", -- or "global" / "local" / "shared"
          tabs = true,       -- separate nnn instance per tab
          fullscreen = true  -- whether to fullscreen explorer window when current tab is empty
        },
        picker = {
          cmd = "nnn -xHP",    -- command override (-p flag is implied)
          style = {
            width = 1.0,       -- percentage relative to terminal size when < 1, absolute otherwise
            height = 1.0,      -- ^
            xoffset = 0.5,     -- ^
            yoffset = 0.5,     -- ^
            border = "rounded" -- border decoration for example "rounded"(:h nvim_open_win)
          },
          session = "global",  -- or "global" / "local" / "shared"
          tabs = false,        -- separate nnn instance per tab
          fullscreen = true    -- whether to fullscreen picker window when current tab is empty
        },
        auto_open = {
          setup = "explorer",                     -- or "explorer" / "picker", auto open on setup function
          tabpage = "picker",                     -- or "explorer" / "picker", auto open when opening new tabpage
          empty = false,                          -- only auto open on empty buffer
          ft_ignore = { "gitcommit" }             -- dont auto open for these filetypes
        },
        auto_close = true,                        -- close tabpage/nvim when nnn is last window
        replace_netrw = "explorer",               -- or "explorer" / "picker"
        mappings = {
          { "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
          { "<C-s>", builtin.open_in_split },     -- open file(s) in split
          { "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
          { "<C-p>", builtin.open_in_preview },   -- open file in preview split keeping nnn focused
          { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
          { "<C-w>", builtin.cd_to_path },        -- cd to file directory
          { "<C-e>", builtin.populate_cmdline }   -- populate cmdline (:) with file(s)
        },                                        -- table containing mappings, see below
        windownav = {                             -- window movement mappings to navigate out of nnn
          left = "<C-w>l",
          right = "<C-w>r",
          next = "<C-w>n",
          prev = "<C-w>p"
        },
        buflisted = true, -- whether or not nnn buffers show up in the bufferlist
        quitcd = "zd",    -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
        offset = true     -- whether or not to write position offset to tmpfile(for use in preview-tui)
      })
    end
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    priority = 9000,
    dependencies = {
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
        theme = "doom",
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
            "=='    _-'                    { L A Z Y V I M }                       \\/   `==",
            "\\   _-'                                                                `-_   /",
            " `''                                                                      ``'  ",
          },

          center = {
            {
              desc = "Launch Nnn Explorer",
              keymap = "SPC n e",
              action = "NnnExplorer",
              icon = " ",
            },

            {
              desc = "Launch Nnn Picker",
              keymap = "SPC n p",
              action = "NnnPicker",
              icon = " ",
            },


            {
              desc = "Last Nnn session",
              keymap = "SPC s l",
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
              keymap = "SPC s p"
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
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      require("dashboard").setup(opts)
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 0
    }
  },

  {
    "lewis6991/gitsigns.nvim",

    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = {
        ignore_whitespace = true
      }
    }
  },

  {
    "echasnovski/mini.animate",
    event = "VeryLazy",

    opts = function(_, opts)
      opts.scroll = {
        enable = false
      }
    end
  },

  {
    "karb94/neoscroll.nvim",

    config = function()
      -- local keymaps = { "<C-u>", "<C-d>", "zt", "zz", "zb" }

      require("neoscroll").setup({
        hide_cursor = false,
        stop_eof = true,              -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = true,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
        -- easing_function = nil, -- Default easing function
        -- pre_hook = nil,  -- Function to run before the scrolling animation starts
        -- post_hook = nil, -- Function to run after the scrolling animation ends
        -- performance_mode = false, -- Disable "Performance Mode" on all buffers.
      })
    end
  }
}
