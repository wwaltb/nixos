{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        keys.enable = lib.mkEnableOption "enables hyprland keymappings";
    };

    config = lib.mkIf config.keys.enable {
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
