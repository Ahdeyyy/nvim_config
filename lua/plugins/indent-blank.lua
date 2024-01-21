return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    config = function()

        require("ibl").setup()
    end
}
