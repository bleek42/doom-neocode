return {

    -- ~ Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'Exafunction/codeium.nvim',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = function(_, opts)
            opts.snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            }
            table.insert(opts.sources, { name = "luasnip" })
        end,
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "hrsh7th/nvim-cmp",
            "rafamadriz/friendly-snippets",

        },
        build = (not LazyVim.is_win())
            and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
            or nil,

    },

    {
        "Exafunction/codeium.nvim",
        cmd = { 'Codeium' },
        build = ':Codeium auth',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },

    },

    {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
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
        "saadparwaiz1/cmp_luasnip",
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
