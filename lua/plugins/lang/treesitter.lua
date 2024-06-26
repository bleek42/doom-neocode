return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "p00f/nvim-ts-rainbow" },

        config = function()
            if vim.loop.os_name().version:match("Windows") then
                require("nvim-treesitter.install").prefer_git = false
            else
                require("nvim-treesitter.install").prefer_git = true
            end

            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    -- "astro",
                    "bash",
                    -- "beancount",
                    -- "bibtex",
                    "c",
                    -- "c_sharp",
                    -- "clojure",
                    "cmake",
                    -- "comment",
                    -- "commonlisp",
                    -- "cooklang",
                    -- "cpp",
                    "css",
                    -- "cuda",
                    -- "d",
                    -- "dart",
                    -- "devicetree",
                    "dockerfile",
                    -- "dot",
                    -- "eex",
                    -- "elixir",
                    -- "elm",
                    -- "elvish",
                    -- "embedded_template",
                    -- "erlang",
                    -- "fennel",
                    "fish",
                    -- "foam",
                    -- "fortran",**
                    -- "fusion",
                    -- "Godot",
                    -- "gleam",
                    -- "Glimmer",
                    -- "glsl",
                    -- "go",
                    -- "gomod",
                    -- "gowork",
                    "graphql",
                    -- "hack",
                    -- "haskell",
                    -- "hcl",
                    -- "heex",
                    "help",
                    -- "hjson",
                    -- "hocon",
                    "html",
                    "http",
                    -- "java",
                    "javascript",
                    "jsdoc",
                    "json",
                    "json5",
                    "jsonc",
                    -- "julia",
                    -- "kotlin",
                    -- "lalrpop",
                    "latex",
                    -- "ledger",
                    -- "llvm",
                    "lua",
                    -- "m68k",
                    "make",
                    "markdown",
                    -- "ninja",
                    -- "nix",
                    -- "norg",
                    -- "ocaml",
                    -- "ocaml_interface",
                    -- "ocamllex",
                    -- "org",
                    -- "pascal",
                    -- "perl",
                    -- "php",
                    -- "phpdoc",
                    -- "pioasm",
                    "prisma",
                    "proto",
                    -- "pug",
                    "python",
                    -- "ql",
                    -- "r",
                    -- "rasi",
                    "regex",
                    -- "rego",
                    -- "rst",
                    -- "ruby",
                    "rust",
                    -- "scala",
                    "scheme",
                    "scss",
                    -- "slint",
                    "solidity",
                    -- "sparql",
                    -- "supercollider",
                    -- "surface",
                    -- "svelte",
                    -- "swift",
                    -- "teal",
                    -- "tlaplus",
                    -- "todotxt",
                    "toml",
                    "tsx",
                    -- "turtle",
                    "typescript",
                    -- "vala",
                    -- "verilog",
                    -- "vim",
                    -- "vue",
                    -- "wgsl",
                    "yaml",
                    -- "yang",
                    -- "zig",
                },
                sync_install = true, --? install languages synchronously (only applied to `ensure_installed`)
                -- ignore_install = {   --? List of parsers to ignore installing
                -- },
                autopairs = {
                    enable = true,
                },
                highlight = {
                    enabled = true
                },
                indent = {
                    enabled = true
                },
                incremental_selection = {
                    enabled = true
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>ma"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>Ma"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
                matchup = {
                    enable = true,
                    disable_virtual_text = false,
                    include_match_words = true,
                },
                -- third party
                rainbow = {
                    enabled = true
                }
            })
        end,
    },

}
