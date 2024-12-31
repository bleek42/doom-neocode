return {
    -- * Autocompletion

    {
        "saghen/blink.compat",
        lazy = true,

        version = "*",

        -- opts = function(_, opts)

        -- end,
    },

    {
        "mikavilpas/blink-ripgrep.nvim",
    },
    {
        "saghen/blink.cmp",
        version = not vim.g.lazyvim_blink_main and "*",
        build = vim.g.lazyvim_blink_main and "cargo build --release",
        opts_extend = {
            "sources.completion.enabled_providers",
            "sources.compat",
            "sources.default",
        },
        dependencies = {
            "saghen/blink.compat",
            "mikavilpas/blink-ripgrep.nvim",
            "L3MON4D3/LuaSnip",
            "Exafunction/codeium.nvim",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-emoji"
        },
        event = "InsertEnter",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        ---@return blink.cmp.Config
        opts = function()
            local opts = {}

            opts.completion = {}

            opts.appearance = {}
            opts.appearance.kind_icons = vim.tbl_extend("keep", {
                Color = "██", -- Use block instead of icon for color items to make swatches more usable
            }, LazyVim.config.icons.kinds)
            opts.completion.ghost_text = {
                enabled = true
            }
            opts.signature = {
                enabled = true
            }
            opts.keymap = {
                preset = "super-tab"
            }

            opts.completion.menu = {
                enabled = true,
                min_width = 15,
                max_height = 10,
                border = "none",
                winblend = 0,
                winhighlight =
                "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                -- Keep the cursor X lines away from the top/bottom of the window
                scrolloff = 2,
                -- Note that the gutter will be disabled when border ~= "none"
                scrollbar = true,
                -- Which directions to show the window,
                -- falling back to the next direction when there"s not enough space
                direction_priority = { "s", "n" },

                -- Whether to automatically show the window when new completion items are available
                auto_show = true,

                -- Screen coordinates of the command line
                cmdline_position = function()
                    if vim.g.ui_cmdline_pos ~= nil then
                        local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                        return { pos[1] - 1, pos[2] }
                    end
                    local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                    return { vim.o.lines - height, 0 }
                end,

                draw = {
                    treesitter = { "lsp" }
                },
            }
            -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } }

            opts.completion.list = {
                -- Maximum number of items to display
                max_items = 200,

                -- Controls if completion items will be selected automatically,
                -- and whether selection automatically inserts
                selection = function(ctx) return ctx.mode == "cmdline" and "auto_insert" or "preselect" end,

                -- Controls how the completion items are selected
                -- "preselect" will automatically select the first item in the completion list
                -- "manual" will not select any item by default
                -- "auto_insert" will not select any item by default, and insert the completion items automatically when selecting them
                --
                -- You may want to bind a key to the `cancel` command, which will undo the selection
                -- when using "auto_insert"
                cycle = {
                    -- When `true`, calling `select_next` at the *bottom* of the completion list
                    -- will select the *first* completion item.
                    from_bottom = true,
                    -- When `true`, calling `select_prev` at the *top* of the completion list
                    -- will select the *last* completion item.
                    from_top = true,
                },
            }

            opts.completion.trigger = {
                -- ? When true, will prefetch the completion items when entering insert mode
                prefetch_on_insert = true,

                -- ? When false, will not show the completion window automatically when in a snippet
                show_in_snippet = true,

                -- When true, will show the completion window after typing a character that matches the `keyword.regex`
                show_on_keyword = true,

                -- When true, will show the completion window after typing a trigger character
                show_on_trigger_character = true,

                -- LSPs can indicate when to show the completion window via trigger characters
                -- however, some LSPs (i.e. tsserver) return characters that would essentially
                -- always show the window. We block these by default.
                show_on_blocked_trigger_characters = function()
                    if vim.api.nvim_get_mode().mode == "c" then return {} end

                    -- you can also block per filetype, for example:
                    -- if vim.bo.filetype == "markdown" then
                    --   return { " ", "\n", "\t", ".", "/", "(", "[" }
                    -- end

                    return { " ", "\n", "\t" }
                end,

                -- ? When both this and show_on_trigger_character are true, will show the completion window
                -- ? when the cursor comes after a trigger character after accepting an item
                show_on_accept_on_trigger_character = true,

                -- ? When both this and show_on_trigger_character are true, will show the completion window
                -- ? when the cursor comes after a trigger character when entering insert mode
                show_on_insert_on_trigger_character = true,

                -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won"t trigger
                -- the completion window when the cursor comes after a trigger character when
                -- entering insert mode/accepting an item
                show_on_x_blocked_trigger_characters = { "'", '"', '(' },
                -- or a function, similar to show_on_blocked_trigger_character
            }

            opts.completion.accept = {
                -- Create an undo point when accepting a completion item
                create_undo_point = true,
                -- Experimental auto-brackets support
                auto_brackets = {
                    -- Whether to auto-insert brackets for functions
                    enabled = true,
                    -- Default brackets to use for unknown languages
                    default_brackets = { "(", ")" },
                    -- Overrides the default blocked filetypes
                    override_brackets_for_filetypes = {},
                    -- Synchronously use the kind of the item to determine if brackets should be added
                    kind_resolution = {
                        enabled = true,
                        blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
                    },
                    -- Asynchronously use semantic token to determine if brackets should be added
                    semantic_token_resolution = {
                        enabled = true,
                        blocked_filetypes = { "java" },
                        -- How long to wait for semantic tokens to return before assuming no brackets should be added
                        timeout_ms = 400,
                    },
                }
            }

            opts.completion.documentation = {
                -- Controls whether the documentation window will automatically show when selecting a completion item
                auto_show = true,
                -- Delay before showing the documentation window
                auto_show_delay_ms = 1500,
                -- Delay before updating the documentation window when selecting a new item,
                -- while an existing item is still visible
                update_delay_ms = 100,
                -- Whether to use treesitter highlighting, disable if you run into performance issues
                treesitter_highlighting = true,
                window = {
                    min_width = 10,
                    max_width = 80,
                    max_height = 20,
                    border = "padded",
                    winblend = 0,
                    winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                    -- Note that the gutter will be disabled when border ~= 'none'
                    scrollbar = true,
                    -- Which directions to show the documentation window,
                    -- for each of the possible menu window directions,
                    -- falling back to the next direction when there's not enough space
                    direction_priority = {
                        menu_north = { 'e', 'w', 'n', 's' },
                        menu_south = { 'e', 'w', 's', 'n' },
                    }
                }
            }



            opts.snippets = {

                expand = function(snippet, _)
                    require("luasnip").lsp_expand(snippet)
                end,
                active = function(filter)
                    if filter and filter.direction then
                        return require("luasnip").jumpable(filter.direction)
                    end
                    return require("luasnip").in_snippet()
                end,
                jump = function(direction)
                    require("luasnip").jump(direction)
                end,
            }

            opts.sources = {
                default = { "lsp", "path", "snippets", "luasnip", "buffer", "ripgrep" },
                -- compat = { "codeium" },
                cmdline = function()
                    -- local type = vim.fn.getcmdtype()
                    -- Search forward and backward
                    -- if type == "/" or type == "?" then return { "buffer" } end
                    -- Commands
                    -- if type == ":" then return { "cmdline" } end
                    return {}
                end,

                providers = {
                    lsp = {
                        name = "LSP",
                        module = "blink.cmp.sources.lsp",
                        opts = {}, -- ? Passed to the source directly, varies by source

                        --- ! NOTE: All of these options may be functions to get dynamic behavior
                        --- ! See the type definitions for more information
                        enabled = true,           -- ? Whether or not to enable the provider
                        async = false,            -- ? Whether we should wait for the provider to return before showing the completions
                        timeout_ms = 2000,        -- ? How long to wait for the provider to return before showing completions and treating it as asynchronous
                        transform_items = nil,    -- ? Function to transform the items before they"re returned
                        should_show_items = true, -- ? Whether or not to show the items
                        max_items = nil,          -- ? Maximum number of items to display in the menu
                        min_keyword_length = 0,   -- ? Minimum number of characters in the keyword to trigger the provider
                        -- ? If this provider returns 0 items, it will fallback to these providers.
                        -- ? If multiple providers falback to the same provider, all of the providers must return 0 items for it to fallback
                        fallbacks = {},
                        score_offset = 0, -- ? Boost/penalize the score of the items
                        override = nil,   -- ? Override the source"s functions
                    },

                    ripgrep = {
                        module = "blink-ripgrep",
                        name = "Ripgrep",
                        -- ? the options below are optional, some default values are shown
                        ---@module "blink-ripgrep"
                        ---@type blink-ripgrep.Options
                        opts = {
                            -- ? For many options, see `rg --help` for an exact description of
                            -- ? the values that ripgrep expects.

                            -- ? the minimum length of the current word to start searching
                            -- ? (if the word is shorter than this, the search will not start)
                            prefix_min_len = 3,

                            -- ? The number of lines to show around each match in the preview
                            -- ? (documentation) window. For example, 5 means to show 5 lines
                            -- ? before, then the match, and another 5 lines after the match.
                            context_size = 5,

                            -- ? The maximum file size of a file that ripgrep should include in
                            -- ? its search. Useful when your project contains large files that
                            -- ? might cause performance issues.
                            -- ? Examples:
                            -- ? "1024" (bytes by default), "200K", "1M", "1G", which will
                            -- ? exclude files larger than that size.
                            max_filesize = "1M",

                            -- ? Specifies how to find the root of the project where the ripgrep
                            -- ? search will start from. Accepts the same options as the marker
                            -- ? given to `:h vim.fs.root()` which offers many possibilities for
                            -- ? configuration. If none can be found, defaults to Neovim"s cwd.
                            --
                            -- ? Examples:
                            -- ? - ".git" (default)
                            -- ? - { ".git", "package.json", ".root" }
                            project_root_marker = ".git",

                            -- ? The casing to use for the search in a format that ripgrep
                            -- ? accepts. Defaults to "--ignore-case". See `rg --help` for all the
                            -- ? available options ripgrep supports, but you can try
                            -- ? "--case-sensitive" or "--smart-case".
                            search_casing = "--ignore-case",

                            -- ? (advanced) Any additional options you want to give to ripgrep.
                            -- ? See `rg -h` for a list of all available options. Might be
                            -- ? helpful in adjusting performance in specific situations.
                            -- ? If you have an idea for a default, please open an issue!
                            --
                            -- ? Not everything will work (obviously).
                            additional_rg_options = {},

                            -- ? When a result is found for a file whose filetype does not have a
                            -- ? treesitter parser installed, fall back to regex based highlighting
                            -- ? that is bundled in Neovim.
                            fallback_to_regex_highlighting = true,
                        },
                    },

                    path = {
                        name = "Path",
                        module = "blink.cmp.sources.path",
                        score_offset = 200,
                        fallbacks = { "buffer" },
                        opts = {
                            trailing_slash = false,
                            label_trailing_slash = true,
                            get_cwd = function(context) return vim.fn.expand(("#%d:p:h"):format(context.bufnr)) end,
                            show_hidden_files_by_default = false,
                        }
                    },

                    codeium = {
                        name = "Codeium",
                        module = "blink.cmp.sources.codeium",
                        score_offset = 500,
                        async = true,

                    },

                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 400, -- show at a lower priority than lsp
                    },

                    -- emoji = {
                    --     name = "Emoji",
                    --     module = "blink.cmp.sources.emoji",
                    --     score_offset = 1000,

                    -- },

                    buffer = {
                        name = 'Buffer',
                        module = 'blink.cmp.sources.buffer',
                        opts = {
                            -- default to all visible buffers
                            get_bufnrs = function()
                                return vim
                                    .iter(vim.api.nvim_list_wins())
                                    :map(function(win) return vim.api.nvim_win_get_buf(win) end)
                                    :filter(function(buf) return vim.bo[buf].buftype ~= 'nofile' end)
                                    :totable()
                            end,
                        }
                    },
                },
            }

            return opts
        end,
        ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
        config = function(_, opts)
            -- ! debug opts
            -- print(vim.inspect(opts))

            -- ! setup compat sources
            local enabled = opts.sources.default
            for _, source in ipairs(opts.sources.compat or {}) do
                opts.sources.providers[source] = vim.tbl_deep_extend(
                    "force",
                    { name = source, module = "blink.compat.source" },
                    opts.sources.providers[source] or {}
                )
                if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
                    table.insert(enabled, source)
                end
            end

            -- ? add ai_accept to <Tab> key
            if not opts.keymap["<Tab>"] then
                if opts.keymap.preset == "super-tab" then -- super-tab
                    opts.keymap["<Tab>"] = {
                        require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
                        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                        "fallback",
                    }
                else -- other presets
                    opts.keymap["<Tab>"] = {
                        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                        "fallback",
                    }
                end
            end

            -- check if we need to override symbol kinds
            for _, provider in pairs(opts.sources.providers or {}) do
                ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
                if provider.kind then
                    local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                    local kind_idx = #CompletionItemKind + 1

                    CompletionItemKind[kind_idx] = provider.kind
                    ---@diagnostic disable-next-line: no-unknown
                    CompletionItemKind[provider.kind] = kind_idx

                    ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
                    local transform_items = provider.transform_items
                    ---@param ctx blink.cmp.Context
                    ---@param items blink.cmp.CompletionItem[]
                    provider.transform_items = function(ctx, items)
                        items = transform_items and transform_items(ctx, items) or items
                        for _, item in ipairs(items) do
                            item.kind = kind_idx or item.kind
                        end
                        return items
                    end

                    -- Unset custom prop to pass blink.cmp validation
                    provider.kind = nil
                end
            end

            require("blink.cmp").setup(opts)
        end
    },

    {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium auth",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "saghen/blink.cmp"
        },

        opts = function()
            local opts = {}

            opts.enable_cmp_source = vim.g.ai_cmp
            opts.virtual_text = {
                enabled = not vim.g.ai_cmp,
                key_bindings = {
                    accept = false, -- handled by nvim-cmp / blink.cmp
                    next = "<M-]>",
                    prev = "<M-[>",
                }
            }



            return opts
        end,

        config = function(_, opts)
            LazyVim.cmp.actions.ai_accept = function()
                if require("codeium.virtual_text").get_current_completion_item() then
                    LazyVim.create_undo()
                    vim.api.nvim_input(require("codeium.virtual_text").accept())
                    return true
                end
            end
            require("codeium").setup(opts)
        end,

    },

    {
        "hrsh7th/cmp-buffer"
    },

    {
        "hrsh7th/cmp-path"
    },

    {
        "hrsh7th/cmp-cmdline"
    },

    {
        "hrsh7th/cmp-nvim-lua"
    },

    {
        "hrsh7th/cmp-emoji"
    },

    {
        "saadparwaiz1/cmp_luasnip"
    },
    -- * Snippets
    {
        "L3MON4D3/LuaSnip",

        config = function()
            LazyVim.cmp.actions.snippet_forward = function()
                if require("luasnip").jumpable(1) then
                    require("luasnip").jump(1)
                    return true
                end
            end
            LazyVim.cmp.actions.snippet_stop = function()
                if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
                    require("luasnip").unlink_current()
                    return true
                end
            end
        end
    },

    {
        "rafamadriz/friendly-snippets",
        lazy = true,
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end,
    }
}
