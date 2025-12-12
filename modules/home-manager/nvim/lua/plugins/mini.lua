return {
	{
		"mini.nvim",
		lazy = false,
		after = function()
			require("mini.ai").setup()
			require("mini.files").setup({
				mappings = {
					close = "<Esc>",
				},
			})
			--require("mini.clue").setup({
			--	triggers = {
			--		{ mode = "n", keys = "<leader>" },
			--		{ mode = "n", keys = "g" },
			--		{ mode = "n", keys = "y" },
			--		{ mode = "n", keys = '"' },
			--	},
			--	clues = {
			--		require("mini.clue").gen_clues.g(),
			--		require("mini.clue").gen_clues.registers(),
			--	},
			--})
			require("mini.diff").setup()
			require("mini.extra").setup()
			-- require("mini.snippets").setup()
			require("mini.git").setup()
			require("mini.pick").setup()
			require("mini.icons").setup()
			require("mini.starter").setup()
			require("mini.statusline").setup()
		end,
		keys = {
			{ "<C-s>", require("mini.files").open, desc = "Open mini files" },
			{ "<leader>fb", require("mini.pick").builtin.buffers, desc = "Buffers" },
			{ "<leader>fh", require("mini.pick").builtin.help, desc = "Help" },
			{ "<C-f>", require("mini.pick").builtin.files, desc = "Files" },
			{ "<leader>fg", require("mini.pick").builtin.grep_live, desc = "Grep" },
			{
				"gO",
				function()
					require("mini.extra").pickers.lsp({ scope = "document_symbol" })
				end,
				desc = "LSP Symbols",
			},
			{ "<leader>fr", require("mini.extra").pickers.oldfiles, desc = "Recent files" },
			{ "<leader>f'", require("mini.extra").pickers.registers, desc = "Registers" },
		},
	},
}
