return {
	{ "MunifTanjim/nui.nvim",         lazy = true },
	{ "echasnovski/mini.icons",       version = "*" },
	{ "nvim-neotest/nvim-nio" },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "ThePrimeagen/vim-be-good" },
	-- {
	--     "numToStr/Comment.nvim",
	--     opts = {
	--         -- add any options here
	--     },
	--     lazy = false,
	-- },
	{ "echasnovski/mini.indentscope", version = "*" },
	{ "echasnovski/mini.comment",     version = "*" },
	{ "echasnovski/mini.ai",          version = "*" },
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		-- stylua: ignore
		keys = {
			{
				"<S-Enter>",
				function() require("noice").redirect(vim.fn.getcmdline()) end,
				mode = "c",
				desc =
				"Redirect Cmdline"
			},
			{
				"<leader>snl",
				function() require("noice").cmd("last") end,
				desc =
				"Noice Last Message"
			},
			{
				"<leader>snh",
				function() require("noice").cmd("history") end,
				desc =
				"Noice History"
			},
			{
				"<leader>sna",
				function() require("noice").cmd("all") end,
				desc =
				"Noice All"
			},
			{
				"<leader>snd",
				function() require("noice").cmd("dismiss") end,
				desc =
				"Dismiss All"
			},
			{
				"<c-f>",
				function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
				silent = true,
				expr = true,
				desc =
				"Scroll forward",
				mode = {
					"i", "n", "s" }
			},
			{
				"<c-b>",
				function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
				silent = true,
				expr = true,
				desc =
				"Scroll backward",
				mode = {
					"i", "n", "s" }
			},
		},
	},
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		init = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>sc", ":Silicon<CR>", desc = "Snapshot Code", mode = "v" },
			})
		end,
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "GeistMono Nerd Font Mono=34;Noto Color Emoji=34",
				theme = "OneHalfLight",
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		init = function()
			vim.keymap.set("n", "<leader>nt", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "<leader>pt", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	{
		"windwp/nvim-ts-autotag",
	},
}
