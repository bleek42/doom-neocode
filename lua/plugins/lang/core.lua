return {
    { "ray-x/lsp_signature.nvim" },
    -- Auto install lsp servers
    {
        'williamboman/mason.nvim',
        build = { ':MasonUpdate' },
        dependencies = { 'williamboman/mason-lspconfig.nvim' },

        opts = {
            ui = {
                border = "single",
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
        'pmizio/typescript-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig'
        },
        config = function()
            require("typescript-tools").setup({
                settings = {
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = 'all',
                        quotePreference = 'auto',
                        includeCompletionsForModuleExports = true,
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false
                    },
                    tsserver_format_options = {
                        allowIncompleteCompletions = false,
                        allowRenameOfImportPath = false
                    },
                }
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = {
            "BufNewFile",
            "BufReadPre"
        },
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = "williamboman/mason.nvim",
            },
            "hrsh7th/nvim-cmp",
            "mrcjkb/rustaceanvim"
        },

        -- config = function(_, opts)
        --     require("mason-lspconfig").setup({
        --         ensure_installed = {
        --             "stylua",
        --             "shellcheck",
        --             "shfmt",
        --             "powershell_es",
        --             "rust_analyzer",
        --             "flake8",
        --         },

        --         handlers = {
        --             function()
        --                 local lspconfig = require('lspconfig')
        --                 local capabilities = require('cmp_nvim_lsp').default_capabilities()
        --                 -- require("lspconfig")[lsp].setup()
        --                 for _, server in ipairs(opts) do
        --                     local settings = {}
        --                     local name
        --                     if type(server) == 'table' then
        --                         settings = server[2]
        --                         name = server[1]
        --                     else
        --                         name = server
        --                     end
        --                     lspconfig[name].setup {
        --                         settings = settings,
        --                         capabilities = capabilities,
        --                     }
        --                 end
        --             end,

        --             rust_analyzer = function() end,
        --             tsserver = function() end,
        --         }
        --     })


        --     -- require('neodev').setup({})
        -- end,
    },

    -- Extra lsp features
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",

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
