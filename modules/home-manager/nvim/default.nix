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
      nixpgs_version = inputs.nixpgs;
      addOverlays = [
        (inputs.nixCats.utils.standardPluginOverlay inputs)
      ];
      packageNames = [ "nvim" ];
      luaPath = "${./.}";

      # lists of plugins
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          lsps = with pkgs; [
            clangd
            lua-language-server
            nixd
          ];
        };
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            snacks-nvim
          ];
          themer = with pkgs; [
            (builtins.getAttr packageDef.categories.colorscheme {
              "kanagawa" = kanagawa-vim;
            })
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
            themer = true;
          };
        };
      };
    };
  };
}
