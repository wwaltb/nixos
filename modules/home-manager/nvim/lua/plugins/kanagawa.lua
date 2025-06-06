return {
	{
		"kanagawa.nvim",
		lazy = false,
		priority = 1000,
		after = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					local palette = colors.palette
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						Pmenu = { bg = theme.ui.bg },
						BlinkCmpMenuBorder = { link = "FloatBorder" },

						["@markup.heading.1"] = { fg = palette.crystalBlue, bold = true },
						RenderMarkdownH1Bg = { bg = palette.waveBlue1 },
						["@markup.heading.2"] = { fg = palette.autumnYellow, bold = true },
						RenderMarkdownH2Bg = { bg = palette.winterYellow },
						["@markup.heading.3"] = { fg = palette.springGreen, bold = true },
						RenderMarkdownH3Bg = { bg = palette.winterGreen },
						["@markup.heading.4"] = { bold = true },
						["@markup.heading.5"] = { bold = true },
						["@markup.heading.6"] = { bold = true },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}
