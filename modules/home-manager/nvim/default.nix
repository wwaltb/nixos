{ config, lib, inputs, ... }: {
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
      packageNames = [ "nvim" ];
      luaPath = "${./.}";

      # lists of plugins
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
        # programs needed for plugins
        lspsAndRuntimeDeps = {
          lsps = with pkgs; [
            clang-tools
            lua-language-server
            nixd
          ];
        };
        # plugins
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            snacks-nvim
            mini-nvim
          ];
          kanagawa = with pkgs.vimPlugins; [
            kanagawa-nvim
          ];
        };
        optionalPlugins = {
          general = [

          ];
        };

      });

      # package to wrap neovim and desired plugins
      packageDefinitions.replace = {
        nvim = { pkgs, ... }: {
          settings = {
            wrapRc = true;
            aliases = [ "vi" "vim" ];
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
