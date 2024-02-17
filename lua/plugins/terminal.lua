return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        opts = {
            size = 12,
            open_mapping = [[<c-\>]],
            shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = '10',
            shell = 'nu',
            border = 'curved',
            persist_size = true,
            persist_mode = true,
        }
    }
}
