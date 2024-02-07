return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {                -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip', -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',         -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true }
    },
    opts = function(_, opts)
        -- print(opts)
        -- print(opts.formatting)
        -- -- original LazyVim kind icon formatter
        if opts.formatting and opts.formatting.format then
            local format_kinds = opts.formatting.format
            opts.formatting.format = function(entry, item)
                format_kinds(entry, item) -- add icons
                return require("tailwindcss-colorizer-cmp").formatter(entry, item)
            end
        end
    end,

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        -- if opts.formatting and opts.formatting.format then
        --     local format_kinds = cmp.config.formatting.format
        --     cmp.config.formatting.format = function(entry, item)
        --         format_kinds(entry, item)
        --         return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        --     end
        -- end
        --
        -- local format_kinds = require("cmp").config.formatting.format
        --
        -- require("cmp").config.formatting.format =
        --     function(entry, item)
        --         format_kinds(entry, item)
        --         return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        --     end
        -- require("cmp").config.formatting = {
        --     format = require("tailwindcss-colorizer-cmp").formatter
        -- }

        cmp.setup({

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" })
            }),
            sources = { {
                name = "nvim_lsp"
            }, {
                name = "luasnip"
            } }
        })
    end

}
