return {

  -- {
  --     "nvim-neo-tree/neo-tree.nvim",
  --     enable = false
  -- },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        width = function()
          return math.min(120, vim.o.columns * 0.75)
        end,
        height = 0.9,
        options = {
          number = false,
          relativenumber = false,
          foldcolumn = "0",
          list = false,
          showbreak = "NONE",
          signcolumn = "no"
        }
      },
      plugins = {
        options = {
          cmdheight = 1,
          laststatus = 1
        }
      },
      on_open = function()
        -- disable diagnostics, indent blankline, and winbar
        vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
        vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
        vim.g.winbar_old = vim.wo.winbar
        vim.g.diagnostics_mode = 0
        vim.g.indent_blankline_enabled = false
        vim.wo.winbar = nil
      end,
      on_close = function()
        -- restore diagnostics, indent blankline, and winbar
        vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
        vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
        vim.wo.winbar = vim.g.winbar_old
      end
    }
  },

  {
    "luukvbaal/nnn.nvim",
    lazy = false,
    priority = 9000,
    cmd = {
      "NnnExplorer",
      "NnnPicker"
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local builtin = require("nnn").builtin

      require("nnn").setup({
        explorer = {
          cmd = "nnn -cxCH",            -- command override (-F1 flag is implied, -a flag is invalid!)
          width = 28,                   -- width of the vertical split
          side = "topleft",             -- or "botright", location of the explorer window
          session = "global",           -- or "global" / "local" / "shared"
          tabs = true,                  -- separate nnn instance per tab
          fullscreen = true             -- whether to fullscreen explorer window when current tab is empty
        },
        picker = {
          cmd = "nnn -cxHP",               -- command override (-p flag is implied)
          style = {
            width = 1.0,                   -- percentage relative to terminal size when < 1, absolute otherwise
            height = 1.0,                  -- ^
            xoffset = 0.5,                 -- ^
            yoffset = 0.5,                 -- ^
            border = "rounded"             -- border decoration for example "rounded"(:h nvim_open_win)
          },
          session = "global",               -- or "global" / "local" / "shared"
          tabs = false,                    -- separate nnn instance per tab
          fullscreen = true                -- whether to fullscreen picker window when current tab is empty
        },
        auto_open = {
          setup = nil,                                      -- or "explorer" / "picker", auto open on setup function
          tabpage = nil,                                    -- or "explorer" / "picker", auto open when opening new tabpage
          empty = false,                                    -- only auto open on empty buffer
          ft_ignore = { "gitcommit" }                       -- dont auto open for these filetypes
        },
        auto_close = true,                                  -- close tabpage/nvim when nnn is last window
        replace_netrw = "explorer",                           -- or "explorer" / "picker"
        mappings = {
          { "<C-t>", builtin.open_in_tab },                 -- open file(s) in tab
          { "<C-s>", builtin.open_in_split },               -- open file(s) in split
          { "<C-v>", builtin.open_in_vsplit },              -- open file(s) in vertical split
          { "<C-p>", builtin.open_in_preview },             -- open file in preview split keeping nnn focused
          { "<C-y>", builtin.copy_to_clipboard },           -- copy file(s) to clipboard
          { "<C-w>", builtin.cd_to_path },                  -- cd to file directory
          { "<C-e>", builtin.populate_cmdline }             -- populate cmdline (:) with file(s)
        },                                                  -- table containing mappings, see below
        windownav = {                                       -- window movement mappings to navigate out of nnn
          left = "<C-w>h",
          right = "<C-w>l",
          next = "<C-w>w",
          prev = "<C-w>W"
        },
        buflisted = true,         -- whether or not nnn buffers show up in the bufferlist
        quitcd = "zd",            -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
        offset = true             -- whether or not to write position offset to tmpfile(for use in preview-tui)
      })
    end
  },

  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "preservim/vim-markdown",
    },

    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/c/second-brain/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/c/second-brain/**.md"
    },
    commands = {
      "ObsidianOpen",
      "ObsidianNew",
      "ObsidianQuickSwitch",
      "ObsidianFollowLink",
      "ObsidianBacklinks",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianTemplate",
      "ObsidianSearch",
      "ObsidianLink",
      "ObsidianLinkNew"
    },

    opts = {
      dir = "~/c/second-brain",       -- no need to call 'vim.fn.expand' here
      completion = {
        nvim_cmp = true
      },

      daily_notes = {
        folder = "Periodic 🌄/Days 🌄"
        -- Optional, if you want to change the date format for the ID of daily notes.
        -- date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        -- alias_format = "%B %-d, %Y",
      },

      disable_frontmatter = true,

      -- TODO: configure to my liking
      -- Optional, alternatively you can customize the frontmatter data.
      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        -- local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- -- `note.metadata` contains any manually added fields in the frontmatter.
        -- -- So here we just make sure those fields are kept in the frontmatter.
        -- if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        --   for k, v in pairs(note.metadata) do
        --     out[k] = v
        --   end
        -- end
        -- return out
      end,

      -- Optional, for templates (see below).
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M"
      },

      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
      end,

      -- Optional, set to true if you use the Obsidian Advanced URI plugin.
      -- https://github.com/Vinzent03/obsidian-advanced-uri
      use_advanced_uri = true,

      -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
      open_app_foreground = true,
      ui = {
        enable = true,                 -- set to false to disable all additional syntax features
        update_debounce = 200,         -- update delay after a text change (in milliseconds)
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = {
            char = "󰄱",
            hl_group = "ObsidianTodo"
          },
          ["x"] = {
            char = "",
            hl_group = "ObsidianDone"
          },
          [">"] = {
            char = "",
            hl_group = "ObsidianRightArrow"
          },
          ["~"] = {
            char = "󰰱",
            hl_group = "ObsidianTilde"
          }
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        external_link_icon = {
          char = "",
          hl_group = "ObsidianExtLinkIcon"
        },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = {
          hl_group = "ObsidianRefText"
        },
        highlight_text = {
          hl_group = "ObsidianHighlightText"
        },
        tags = {
          hl_group = "ObsidianTag"
        },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = {
            bold = true,
            fg = "#f78c6c"
          },
          ObsidianDone = {
            bold = true,
            fg = "#89ddff"
          },
          ObsidianRightArrow = {
            bold = true,
            fg = "#f78c6c"
          },
          ObsidianTilde = {
            bold = true,
            fg = "#ff5370"
          },
          ObsidianRefText = {
            underline = true,
            fg = "#c792ea"
          },
          ObsidianExtLinkIcon = {
            fg = "#c792ea"
          },
          ObsidianTag = {
            italic = true,
            fg = "#89ddff"
          },
          ObsidianHighlightText = {
            bg = "#75662e"
          }
        }
      }
    },

    -- mappings = {
    --   ["gf"] = require("obsidian.mapping").gf_passthrough(),
    -- },

    config = function(_, opts)
      require("obsidian").setup(opts)
      vim.keymap.set("n", "gd", function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gd"
          end
        end,
        {
          noremap = false,
          expr = true
        })
    end
  },

  {
    "echasnovski/mini.move",
    keys = { {
      "<M-l>",
      mode = { "n", "v" }
    }, {
      "<M-k>",
      mode = { "n", "v" }
    }, {
      "<M-j>",
      mode = { "n", "v" }
    }, {
      "<M-h>",
      mode = { "n", "v" }
    } },
    opts = {}
  },

  -- {
  --     "wakatime/vim-wakatime",
  --     enabled = false,
  --     config = function()
  --         local waka_time = require("wakatime")
  --     end
  -- },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",

  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },

    config = function()
      require("todo-comments").setup({})
    end
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = function()
      local prefix = "<leader>s"
      return {
        open_cmd = "new",
        mapping = {
          send_to_qf = {
            map = prefix .. "q"
          },
          replace_cmd = {
            map = prefix .. "c"
          },
          show_option_menu = {
            map = prefix .. "o"
          },
          run_current_replace = {
            map = prefix .. "C"
          },
          run_replace = {
            map = prefix .. "R"
          },
          change_view_mode = {
            map = prefix .. "v"
          },
          resume_last_search = {
            map = prefix .. "l"
          }
        }
      }
    end
  },

  {
    "echasnovski/mini.surround",

    opts = {
      n_lines = 200
    },
    keys = {
      {
        "sa",
        desc = "Add surrounding",
        mode = { "n", "v" }
      },
      {
        "sd",
        desc = "Delete surrounding"
      },
      {
        "sf",
        desc = "Find right surrounding"
      },
      {
        "sF",
        desc = "Find left surrounding"
      },
      {
        "sh",
        desc = "Highlight surrounding"
      },
      {
        "sr",
        desc = "Replace surrounding"
      },
      {
        "sn",
        desc = "Update `MiniSurround.config.n_lines`"
      }
    }
  },

  -- Use local .editorconfig files
  { 'gpanders/editorconfig.nvim', },
}
