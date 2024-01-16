return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "ThePrimeagen/Harpoon"
    },
    config = function(_, opts)
      local actions = require("telescope.actions")
      local keymaps = {}
      keymaps.search = function(actions)
        return {
          ["<C-c>"] = actions.delete_buffer,
          ["<C-q>"] = actions.send_to_qflist
        }
      end

      require("telescope").setup({
        defaults = {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case"
            },
            ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
          },
          mappings = {
            i = keymaps.search(actions),
            n = keymaps.search(actions)
          },
          layout_strategy = "flex"
        }
      })

      require("telescope").load_extension("dap")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("harpoon")
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },

  {
    "joshmedeski/telescope-smart-goto.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "ThePrimeagen/harpoon" }
  },

  {

    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },

    config = function()
      local keymaps = {}
      keymaps.diagnostics = {
        ["close"] = "q",
        ["cancel"] = "c",
        ["refresh"] = "r",
        ["jump"] = "j",
        ["hover"] = "h",
        ["toggle_fold"] = "<space>",
        ["previous"] = "<C-p>",
        ["next"] = "<C-n>"
      }

      vim.cmd([[autocmd WinEnter * if winnr('$') == 1 && &ft == 'Trouble' | q | endif]])

      require("trouble").setup({
        use_diagnostic_signs = true,
        action_keys = keymaps.diagnostics
      })
    end,
  }

}
