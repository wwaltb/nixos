vim.lsp.config.nixd = {
	cmd = { "nixd" },
	root_markers = { ".git", "flake.nix" },
	filetypes = { "nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/walt/nixos").nixosConfigurations.jonsbo6.options',
				},
				--home_manager = {
				--	expr =
				--	'(builtins.getFlake \"/home/walt/nixos\").homeConfigurations."walt@jonsbo6".options',
				--},
			},
			formatting = {
				command = { "alejandra" },
			},
		},
	},
}

vim.lsp.enable("nixd")
