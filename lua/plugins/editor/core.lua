return {

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "TodoTrouble",
      "TodoTelescope",
      "TodoLocList",
      "TodoQuickFix"
    },

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

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  -- {
  --     "wakatime/vim-wakatime",
  --     enabledd = false,
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
    "907th/vim-auto-save",
    config = function()
      vim.g.auto_save = 0
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    opts = {
      indent = {
        char = "▏"
      }
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
    opts = {
      modes = {
        char = {
          jump_labels = true
        }
      }
    }
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons"
    }

    -- opts = {},
  },

  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end
  },


  { "lambdalisue/suda.vim" },

  { "junegunn/vim-easy-align" },

  -- Use local .editorconfig files
  { 'gpanders/editorconfig.nvim', },
}
