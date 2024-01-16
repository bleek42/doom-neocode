return {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "p00f/nvim-ts-rainbow" },

    config = function()
      require("nvim-treesitter.install").prefer_git = true

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "c_sharp",
          "css",
          "dockerfile",
          "go",
          "graphql",
          "html",
          "htmldjango",
          "hyprlang",
          "javascript",
          "json",
          "json5",
          "jsonc",
          "latex",
          "lua",
          "markdown",
          "nix",
          "nu",
          "python",
          "regex",
          "rust",
          "scss",
          "toml",
          "typescript",
          "yaml",
          "zig",
        },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true
        },
        sync_install = false,
        -- third party
        rainbow = {
          enable = true
        }
      })
    end,
  },

}
