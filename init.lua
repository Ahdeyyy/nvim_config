vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {
  clear = true
})
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*"
})
require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}
-- neovide configs
require("neovide")
-- my main configs
require("core")
require("vim-opts")
-- vim.cmd([[ autocmd BufWritePre * Format ]])
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
