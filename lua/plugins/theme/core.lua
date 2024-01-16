-- local themer = require("themer")

return {
  {
    "hardhackerlabs/theme-vim",
    name = "hardhacker",
    lazy = false,
    priority = 9000,
    config = function()
      vim.g.hardhacker_hide_tilde = 1
      vim.g.hardhacker_keyword_italic = 1
      -- custom highlights
      -- vim.g.hardhacker_custom_highlights = {}
      vim.cmd("colorscheme hardhacker")
      -- local themer = require("themer")
      -- themer.activate_theme(themer.theme.name, themer.theme.style, false)
    end
  },
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai",
    priority = 3000,
    -- config = function()
    --   require("monokai").setup()
    --   -- themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },

  {
    "edeneast/nightfox.nvim",
    name = "nightfox",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    -- priority = 9000,
    -- config = function()
    --     themer.activate_theme(themer.theme.name, themer.theme.style, false)
    -- end
  }
}
