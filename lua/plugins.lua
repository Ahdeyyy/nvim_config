return {
    { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
    { 'ThePrimeagen/vim-be-good' }, {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false
},
    {
        'folke/which-key.nvim',
        opts = {}
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }

                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }
}
