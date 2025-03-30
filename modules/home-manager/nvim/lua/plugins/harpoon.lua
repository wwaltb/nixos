return {
	{
		"harpoon2",
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Add to harpoon list",
			},
			{
				"<leader>ht",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Open harpoon list",
			},
			{
				"<leader>hd",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Open previous harpooned file",
			},
			{
				"<leader>hf",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Open next harpooned file",
			},
			{
				"<C-h>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Open first harpooned file",
			},
			{
				"<C-j>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Open second harpooned file",
			},
			{
				"<C-k>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Open third harpooned file",
			},
			{
				"<C-l>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Open fourth harpooned file",
			},
		},
		after = function()
			require("harpoon").setup({
				settings = {
					save_on_toggle = true,
				},
			})
		end,
	},
}
