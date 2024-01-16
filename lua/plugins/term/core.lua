return {
  {
    "phaazon/hop.nvim",
    name = "hop",
    branch = "v2",
    enabled = function()
      if vim.g.vscode then
        return true
      else
        return false
      end
    end,

    config = function()
      require("hop").setup({})
    end
  },

  {
    "b3nj5m1n/kommentary",
    enabled = function()
      if vim.g.vscode then
        return true
      else
        return false
      end
    end,

    config = function()
      require("kommentary.config")
    end
  },

  {
    "unblevable/quick-scope",
    enabled = function()
      if vim.g.vscode then
        return true
      else
        return false
      end
    end,
  }
}
