{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixCats.homeModule
  ];

  options = {
    nvim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.nvim.enable {
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      addOverlays = [
        (inputs.nixCats.utils.standardPluginOverlay inputs)
      ];
      packageNames = ["nvim" "testvim"];
      luaPath = "${./.}";

      # lists of plugins
      categoryDefinitions.replace = {
        pkgs,
        settings,
        categories,
        extra,
        name,
        mkNvimPlugin,
        ...
      } @ packageDef: {
        # programs needed for plugins
        lspsAndRuntimeDeps = {
          lsps = with pkgs; [
            # c/c++
            clang-tools

            # lua
            lua-language-server
            stylua

            # nix
            alejandra
            nixd
          ];
        };
        # plugins
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            mini-nvim
            nvim-treesitter.withAllGrammars
          ];
          kanagawa = with pkgs.vimPlugins; [
            kanagawa-nvim
          ];
        };
        optionalPlugins = {
          general = with pkgs.vimPlugins; [
            blink-cmp
            conform-nvim
            harpoon2
            which-key-nvim
          ];
        };
      };

      # package to wrap neovim and desired plugins
      packageDefinitions.replace = {
        nvim = {pkgs, ...}: {
          settings = {
            wrapRc = true;
            aliases = ["vi" "vim"];
          };
          categories = {
            general = true;
            lsps = true;
            kanagawa = true;
          };
        };
        testvim = {pkgs, ...}: {
          settings = {
            wrapRc = false;
            unwrappedCfgPath = "/home/walt/nixos/modules/home-manager/nvim";
            aliases = ["tvim"];
            #neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
          };
          categories = {
            general = true;
            lsps = true;
            kanagawa = true;
          };
        };
      };
    };
  };
}
