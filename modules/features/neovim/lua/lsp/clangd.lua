vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--fallback-style=webkit",
	},
	root_markers = { "compile_commands.json", "compile_flags.txt" },
	filetypes = { "c", "cpp" },
}

vim.lsp.enable("clangd")
