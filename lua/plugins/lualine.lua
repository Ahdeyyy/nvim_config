-- Set lualine as statusline
-- See `:help lualine.txt`
return {

    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                theme = "poimandres",
            }
        })
    end

}
