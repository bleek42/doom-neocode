return {
  { "ray-x/lsp_signature.nvim" },
  -- Auto install lsp servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp"
    },


    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          },
        },

        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          },
        },

        eslint = {}
      },
    },

    config = function(_, opts)
      -- require('neodev').setup({})
      -- local lsp = require('lsp')
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {
        require("bash"),
        require("c"),
        require("csharp"),
        require("dockerfile"),
        require("go"),
        require("lua"),
        require("nu"),
        require("nix"),
        require("rust"),
        require("terraform"),
        require("yaml"),
        require("zig"),
      }

      for _, server in ipairs(servers.server_settings) do
        local settings = {}
        local name
        if type(server) == 'table' then
          settings = server[2]
          name = server[1]
        else
          name = server
        end
        lspconfig[name].setup {
          settings = settings,
          capabilities = capabilities,
        }
      end
    end,
  },

  -- Extra lsp features
  {
    'nvimdev/lspsaga.nvim',
    event = { 'LspAttach' },

    config = function()
      require('lspsaga').setup({
        lightbulb = {
          sign = false,
        },
        ui = {
          border = 'rounded',
        },
      })
    end
  },


  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    build = { ':MasonUpdate' },

    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
      ui = {
        border = "double",
        icons = {
          package_installed = " ",
          package_pending = "󰌚 ",
          package_uninstalled = "󰢤 "
        }
      }
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji"
    },

  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      local daps = require("daps")



      for _, server in pairs(daps) do
        if server ~= nil then
          server.setup()
        end
      end

      require("dap.ext.vscode").load_launchjs(nil, {})
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = {
          template = {
            annotation_convention = "emmylua"
          }
        },
        typescript = {
          template = {
            annotation_convention = "tsdoc"
          }
        },
        typescriptreact = {
          template = {
            annotation_convention = "tsdoc"
          }
        }
      }
    }
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
}



-- you can do any additional lsp server setup here
-- return true if you don't want this server to be setup with lspconfig
-- -@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
-- setup = {
-- -- example to setup with typescript.nvim
-- tsserver = function(_, opts)
--     require("typescript").setup({ server = opts })
--     return true
-- end,

-- eslint = function()
--     require("lazyvim.util").lsp.on_attach(function(client)
--         if client.name == "eslint" then
--             client.server_capabilities.documentFormattingProvider = true
--         elseif client.name == "tsserver" then
--             client.server_capabilities.documentFormattingProvider = false
--         end
--     end)
-- end
-- Specify * to use this function as a fallback for any server
-- dependencies = {
--     -- add tsserver and setup with typescript.nvim instead of lspconfig
--     "jose-elias-alvarez/typescript.nvim",
--     init = function()
--         require("lazyvim.util").lsp.on_attach(function(_, buffer)
--             -- stylua: ignore
--             vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
--                 { buffer = buffer, desc = "Organize Imports" })
--             vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
--         end)
--     end,
-- },
-- ["*"] = function(server, opts) end,
