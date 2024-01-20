return {

  {
    "zaldih/themery.nvim",
    dependencies = {
      "hardhackerlabs/theme-vim",
      "loctvl842/monokai-pro",
      "catppuccin/nvim",
      "projeckt0n/github-nvim-theme"
    },

    config = function()
      -- local themes = {

      --   {
      --     name = "HardHacker",
      --     colorscheme = "hardhacker"
      --   },

      --   {
      --     name = "tokyonight"
      --   },

      --   {
      --     name = "gruvbox",
      --   },

      --   {
      --     name = "onedark",
      --   },

      --   {
      --     name = "nord",
      --   },

      --   {
      --     name = "github",
      --   }
      -- }


      require("themery").setup({
        themes = {
          "hardhacker",
          "monokai",
          "catppuccin",
          "github",
          "nightfox",
          "gruvbox",
          "onedark",
          "tokyonight"
        },

        themeConfigFile = vim.fn.stdpath("config") .. "/lua/config/theme.lua",

        livePreview = true,
        -- Enable theme switching with vim commands
        enableCommands = true,

        -- Enable theme switching with vim autocmds
        enableAutocmds = true,

        -- Enable theme switching with vim autocommands
        enableAutocommands = true,

        -- Enable theme switching with vim functions
        enableFunctions = true,

        -- Enable theme switching with vim variables
        enableVariables = true,

        -- Enable theme switching with vim highlight groups
        enableHighlightGroups = true

      })
    end

  },
  {
    "hardhackerlabs/theme-vim",
    name = "hardhacker",
    lazy = false,
    priority = 9000,

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

      vim.g.hardhacker_hide_tilde = 1
      vim.g.hardhacker_keyword_italic = 1
      -- vim.g.hardhacker_darker = 0
      vim.cmd.colorscheme("hardhacker")
    end
  },

  {
    "tanvirtin/monokai.nvim",
    name = "monokai",

    config = function()
      local monokai = require("monokai")
      monokai.setup({
        palette = monokai.pro
      })
      vim.cmd.colorscheme("monokai")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",

    config = function()
      -- local themer = require("utils.themer")
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "projekt0n/github-nvim-theme",
    -- name = "github",

    config = function()
      require("github-theme").setup({
        options = { transparent = false },
      })

      vim.cmd.colorscheme("github_dark_dimmed")
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",

    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end
  },

  {
    "edeneast/nightfox.nvim",
    name = "nightfox",

    config = function()
      vim.cmd.colorscheme("nightfox")
    end
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",

    config = function()
      require("onedark").setup({
        style = 'cool',
        transparent = true,
        transparent_sidebar = false,
      })

      require("onedark").load()
      -- vim.cmd.colorscheme("onedark")
    end

  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",

    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = false,
      })

      vim.cmd.colorscheme("tokyonight")
    end
  }
}
