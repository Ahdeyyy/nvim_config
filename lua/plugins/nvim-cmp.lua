return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {                -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip', -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        "hrsh7th/cmp-buffer",
        'hrsh7th/cmp-path', -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true }
    },

    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },
            formatting = {
                format = function(_, item)
                    local icons = {
                        Array         = " ",
                        Boolean       = "󰨙 ",
                        Class         = " ",
                        Codeium       = "󰘦 ",
                        Color         = " ",
                        Control       = " ",
                        Collapsed     = " ",
                        Constant      = "󰏿 ",
                        Constructor   = " ",
                        Copilot       = " ",
                        Enum          = " ",
                        EnumMember    = " ",
                        Event         = " ",
                        Field         = " ",
                        File          = " ",
                        Folder        = " ",
                        Function      = "󰊕 ",
                        Interface     = " ",
                        Key           = " ",
                        Keyword       = " ",
                        Method        = "󰊕 ",
                        Module        = " ",
                        Namespace     = "󰦮 ",
                        Null          = " ",
                        Number        = "󰎠 ",
                        Object        = " ",
                        Operator      = " ",
                        Package       = " ",
                        Property      = " ",
                        Reference     = " ",
                        Snippet       = " ",
                        String        = " ",
                        Struct        = "󰆼 ",
                        TabNine       = "󰏚 ",
                        Text          = " ",
                        TypeParameter = " ",
                        Unit          = " ",
                        Value         = " ",
                        Variable      = "󰀫 ",
                    }
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            }
        }
    end,
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end
        require("cmp").setup(opts)
        -- local cmp = require("cmp")
        -- local luasnip = require("luasnip")

        -- cmp.setup({
        --
        --     snippet = {
        --         expand = function(args)
        --             luasnip.lsp_expand(args.body)
        --         end
        --     },
        -- NOTE: get a feel for the lazyvim auto completion before reverting to this
        -- mapping = cmp.mapping.preset.insert({
        --     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --     ["<C-Space>"] = cmp.mapping.complete(),
        --     ["<CR>"] = cmp.mapping.confirm({
        --         behavior = cmp.ConfirmBehavior.Replace,
        --         select = true
        --     }),
        --     ["<Tab>"] = cmp.mapping(function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         elseif luasnip.expand_or_jumpable() then
        --             luasnip.expand_or_jump()
        --         else
        --             fallback()
        --         end
        --     end, { "i", "s" }),
        --     ["<S-Tab>"] = cmp.mapping(function(fallback)
        --         if cmp.visible() then
        --             cmp.select_prev_item()
        --         elseif luasnip.jumpable(-1) then
        --             luasnip.jump(-1)
        --         else
        --             fallback()
        --         end
        --     end, { "i", "s" })
        -- }),
        -- sources = {
        --     {
        --         name = "nvim_lsp"
        --     },
        --     {
        --         name = "luasnip"
        --     },
        --     {
        --         name = "buffer"
        --     },
        -- }
        --[[ }) ]]
    end

}
