return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false
  },

  {
    "luukvbaal/nnn.nvim",
    lazy = false,
    priority = 8500,
    cmd = {
      "NnnExplorer",
      "NnnPicker"
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local nnn = require("nnn")

      nnn.setup({
        explorer = {
          cmd = "nnn -cxnRH", -- command override (-F1 flag is implied, -a flag is invalid!)
          width = 28,         -- width of the vertical split
          side = "topleft",   -- or "botright", location of the explorer window
          session = "local",  -- or "global" / "local" / "shared"
          tabs = true,        -- separate nnn instance per tab
          fullscreen = true   -- whether to fullscreen explorer window when current tab is empty
        },
        picker = {
          cmd = "nnn -cxP",    -- command override (-p flag is implied)
          style = {
            width = 1.0,       -- percentage relative to terminal size when < 1, absolute otherwise
            height = 1.0,      -- ^
            xoffset = 0.5,     -- ^
            yoffset = 0.5,     -- ^
            border = "rounded" -- border decoration for example "rounded"(:h nvim_open_win)
          },
          session = "shared",  -- or "global" / "local" / "shared"
          tabs = false,        -- separate nnn instance per tab
          fullscreen = true    -- whether to fullscreen picker window when current tab is empty
        },
        auto_open = {
          setup = "explorer",                         -- or "explorer" / "picker", auto open on setup function
          tabpage = "picker",                         -- or "explorer" / "picker", auto open when opening new tabpage
          empty = false,                              -- only auto open on empty buffer
          ft_ignore = { "gitcommit" }                 -- dont auto open for these filetypes
        },
        auto_close = true,                            -- close tabpage/nvim when nnn is last window
        replace_netrw = 1,                            -- or "explorer" / "picker"
        mappings = {
          { "<C-t>", nnn.builtin.open_in_tab },       -- open file(s) in tab
          { "<C-s>", nnn.builtin.open_in_split },     -- open file(s) in split
          { "<C-v>", nnn.builtin.open_in_vsplit },    -- open file(s) in vertical split
          { "<C-p>", nnn.builtin.open_in_preview },   -- open file in preview split keeping nnn focused
          { "<C-y>", nnn.builtin.copy_to_clipboard }, -- copy file(s) to clipboard
          { "<C-w>", nnn.builtin.cd_to_path },        -- cd to file directory
          { "<C-e>", nnn.builtin.populate_cmdline }   -- populate cmdline (:) with file(s)
        },                                            -- table containing mappings, see below
        windownav = {                                 -- window movement mappings to navigate out of nnn
          left = "<C-a>",
          right = "<C-d>",
          next = "<C-n>",
          prev = "<C-p>"
        },
        buflisted = true, -- whether or not nnn buffers show up in the bufferlist
        quitcd = "zd",    -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
        offset = true     -- whether or not to write position offset to tmpfile(for use in preview-tui)
      })
    end
  },


}
