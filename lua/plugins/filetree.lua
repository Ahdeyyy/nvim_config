return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        {
            "<leader>ft",
            "<cmd>Neotree toggle<cr>",
            desc = "Toggle NeoTree",
            noremap = true,
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    opts = {
        close_if_last_window = false,
        window = {
            position = "right",
            width = 25,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        },
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false, -- only works on Windows for hidden files/directories
            },
        },
    },
}
