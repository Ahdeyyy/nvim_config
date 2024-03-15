return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = { {
        "<leader>ft",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle NeoTree",
    } },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_hidden = false, -- only works on Windows for hidden files/directories
            },
        },
    },
}
