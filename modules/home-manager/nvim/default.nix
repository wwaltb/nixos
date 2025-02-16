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
        lspsAndRuntimeDeps = {
          lsps = with pkgs; [
            clang-tools
            lua-language-server
            nixd
          ];
        };
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            snacks-nvim
          ];
          themer = with pkgs.vimPlugins; [
            (builtins.getAttr (categories.colorscheme or "kanagawa") {
              "kanagawa" = kanagawa-nvim;
            })
          ];
        };
        optionalPlugins = {
          general = [

          ];
          mini = with pkgs.vimPlugins; [
            # text editing
            mini-ai
            mini-comment
            # general workflow
            mini-files
            mini-pick
            # appearance
            mini-icons
            mini-starter
            mini-statusline
            # other
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
            colorscheme = "kanagawa";
            mini = true;
          };
        };
      };
    };
  };
}
