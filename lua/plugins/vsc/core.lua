if not vim.g.vscode then
  return {}
else
  return {

    {
      "unblevable/quick-scope",
    },

    {
      "phaazon/hop.nvim",
      name = "hop",
      branch = "v2",

      config = function()
        require("hop").setup({})
      end
    },

    {
      "b3nj5m1n/kommentary",

      config = function()
        require("kommentary.config")
      end
    },

  }
end
