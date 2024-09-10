return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
        opts = {
            size = 14,
            open_mapping = [[<c-\>]],
            shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = "10",
            shell = "nu",
            persist_size = true,
            persist_mode = true,
            direction = "float",
            auto_scroll = true,
            float_opts = {
                border = "curved",
            },
        },
    },
}
