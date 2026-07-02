{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.neovim = {pkgs, ...}: {
    # environment.systemPackages = [ neovim ];
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
    };

    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;

      settings = {
        aliases = ["vi" "vim"];
        config_directory = ./.;
      };

      runtimePkgs = with pkgs; [
        # c/c++
        clang-tools
        # lua
        lua-language-server
        stylua
        # nix
        alejandra
        nixd
      ];

      specs = with pkgs.vimPlugins; {
        lze = lze;
        mini-nvim = mini-nvim;
        treesitter = nvim-treesitter.withAllGrammars;
        # dooing = pkgs.neovimPlugins.dooing;
        kanagawa = kanagawa-nvim;
        blink-cmp = blink-cmp;
        conform-nvim = conform-nvim;
        harpoon2 = harpoon2;
        which-key-nvim = which-key-nvim;
      };
    };
  };
}
