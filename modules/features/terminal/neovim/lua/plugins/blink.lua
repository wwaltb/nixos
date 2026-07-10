return {
	{
		"blink.cmp",
		event = "DeferredUIEnter",
		on_require = "blink",
		after = function()
			require("blink.cmp").setup({
				keymap = { preset = "default" },
				completion = {
					documentation = {
						auto_show = true,
					},
				},
				signature = {
					enabled = true,
				},
			})
		end,
	},
}
