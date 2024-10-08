function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\>]], opts)
	-- vim.keymap.set("t", "jk", [[<C-\>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h <CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>windcmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.keymap.set("n", "<C-t>", "ToggleTerm <CR>")

return {

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		opts = {
			size = 14,
			open_mapping = [[<C-t>]],
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = "10",
			noremap = true,
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
