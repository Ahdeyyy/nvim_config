-- Set lualine as statusline
-- See `:help lualine.txt`
return {

    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "dracula",
                component_separators = "|",
                section_separators = ""
            }
        })

    end

}
