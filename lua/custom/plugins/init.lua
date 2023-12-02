-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		'theprimeagen/harpoon',
		config = function()
			local mark = require('harpoon.mark')
			local ui = require('harpoon.ui')

			vim.keymap.set('n', '<leader>a', mark.add_file)
			vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

			vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
			vim.keymap.set('n', '<C-g>', function() ui.nav_file(2) end)
			vim.keymap.set('n', '<C-,>', function() ui.nav_file(3) end)
			vim.keymap.set('n', '<C-.>', function() ui.nav_file(4) end)
		end
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {}
	},
	{
		'windwp/nvim-ts-autotag',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-ts-autotag').setup({})
		end,
		lazy = true,
		event = 'VeryLazy'
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	}
}
