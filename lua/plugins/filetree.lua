return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = { {
        "<leader>ft",
        "<cmd>Neotree toggle<cr>",
        desc = "NeoTree"
    } },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"                                              -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}