{ config, lib, pkgs, inputs, ... }:
{
  options = {
    hypr-keys.enable = lib.mkEnableOption "enables hyprland keymappings";
  };

  config = lib.mkIf config.hypr-keys.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          "super, code:47, exec, ghostty"
          "super shift, code:47, exec, firefox"
          "super, d, killactive"
          "super shift, m, exit"

          "super, h, movefocus, l"
          "super, j, movefocus, d"
          "super, k, movefocus, u"
          "super, l, movefocus, r"
        ];
      };
    };
  };
}
