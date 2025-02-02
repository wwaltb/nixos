{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        hypr-keys.enable = lib.mkEnableOption "enables hyprland keymappings";
    };

    config = lib.mkIf config.hypr-keys.enable {
        wayland.windowManager.hyprland = {
            settings = {
                bind = [
                    "super, code:47, exec, kitty"
                    "super, d, killactive"
                    "super shift, m, exit"
                ];
            };
        };
    };
}
