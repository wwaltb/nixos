return {
	{
		"conform.nvim",
		event = "BufWritePre",
		keys = {
			{
				"gF",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format",
			},
		},
		after = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},

				format_on_save = {
					lsp_format = "fallback",
					timeout = 700,
				},
			})
		end,
	},
}
