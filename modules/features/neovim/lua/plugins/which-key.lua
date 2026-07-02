return {
	{
		"which-key.nvim",
		after = function()
			require("which-key").setup({
				preset = "helix",
				delay = 420,
				win = {
					border = "single",
				},
				show_help = false,
			})
			require("which-key").add({
				{ "<leader>f", group = "Fuzzy Find" },
				{ "<leader>h", group = "Harpoon Man" },
				{ "gr", group = "LSP" },
			})
		end,
	},
}
