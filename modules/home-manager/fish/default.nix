{ config, lib, pkgs, ... }:
{
  options = {
    fish.enable = lib.mkEnableOption "enables fish configuration";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = with config.lib.stylix.colors; ''
        set -g fish_color_autosuggestion ${colors.base04}
        set -g fish_color_command ${colors.base0C}
        set -g fish_color_param ${colors.base0E}
        set -g fish_color_error ${colors.base0F}
        set -g fish_color_comment ${colors.base04}
      '';
    };
  };
}
