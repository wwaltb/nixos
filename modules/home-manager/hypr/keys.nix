{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hypr-keys.enable = lib.mkEnableOption "hyprland keymappings";
  };

  config = lib.mkIf config.hypr-keys.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          ## window management ##

          # close window
          "super, d, killactive"
          "super, f, fullscreen"

          # navigate windows
          "super, h, movefocus, l"
          "super, j, movefocus, d"
          "super, k, movefocus, u"
          "super, l, movefocus, r"

          ## misc ##

          # launch applications
          "super, space, exec, tofi-drun | xargs -r hyprctl dispatch exec"
          "super, code:47, exec, ghostty"
          "super shift, code:47, exec, firefox"

          # 1password
          "super, p, exec, 1password --quick-access"
          "super shift, p, exec, 1password --toggle"

          # exit hyprland
          "super shift, m, exit"
        ];
      };
    };
  };
}
