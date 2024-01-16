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

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },

    {

        "907th/vim-auto-save",

        config = function()
            vim.g.auto_save = 0
        end
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        -- @type Flash.Config
        opts = {
            modes = {
                char = {
                    jump_labels = true
                }
            }
        }
    },

    {
        "nacro90/numb.nvim",

        config = function()
            require("numb").setup()
        end
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        }

        -- opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",

        opts = {
            indent = {
                char = "▏"
            }
        },
    },

    { "lambdalisue/suda.vim" },

    { "junegunn/vim-easy-align" }
}
