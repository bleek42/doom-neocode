return {

    {
        "danymat/neogen",
        cmd = "Neogen",
        opts = function()
            return {
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
        end,
    },

    {
        'pmizio/typescript-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        ft = {
            "typescript",
            "typescriptreact",
            "typescript.tsx"
        },

        opts = {
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
        },

        -- config = function(_, opts)
        --     -- print(vim.inspect(opts))
        --     require("typescript-tools").setup(opts)
        -- end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        ft = { "rust", "rs" },

        opts = {
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<leader>cR", function()
                        vim.cmd.RustLsp("codeAction")
                    end, { desc = "Code Action", buffer = bufnr })
                    vim.keymap.set("n", "<leader>dr", function()
                        vim.cmd.RustLsp("debuggables")
                    end, { desc = "Rust Debuggables", buffer = bufnr })
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Add clippy lints for Rust.
                        checkOnSave = true,
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                    },
                },
            },
        },

        config = function(_, opts)
            vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
            if vim.fn.executable("rust-analyzer") == 0 then
                LazyVim.error(
                    "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
                    { title = "rustaceanvim" }
                )
            end
        end,
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
