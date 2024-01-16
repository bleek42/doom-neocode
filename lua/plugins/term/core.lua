return {

  {
    "aserowy/tmux.nvim",
    enable = false,
    -- function ()
    --   if vim.g.vscode then
    --     return false
    --   end
    --   return true
    -- end,

    config = function()
      require("tmux").setup(
        {
          copy_sync = {
            enable = true,
            redirect_to_clipboard = true
          },
          navigation = {
            cycle_navigation = false,
            enable_default_keybindings = true,
            persist_zoom = true
          },
          resize = {
            enable_default_keybindings = true
          }
        }
      )
    end
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      terminal_mappings = false
    }
  }

}
