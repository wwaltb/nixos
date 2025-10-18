{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hyprland.keys.enable = lib.mkEnableOption "hyprland keymappings";
  };

  config = lib.mkIf config.hyprland.keys.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind =
          [
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
          ]
          ++ (
            builtins.concatLists (builtins.genList (
                i: let
                  ws = i + 1;
                in [
                  "super, code:1${toString i}, workspace, ${toString ws}"
                  "super shift, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
      };
    };
  };
}
