{ config, lib, pkgs, ... }:
{
    options = {
        kanagawa.enable = lib.mkEnableOption "enables kanagawa stylix configuration";
    };

    config = lib.mkIf config.kanagawa.enable {
        stylix = {
            enable = true;
            image = ../../assets/bus-wallpaper.png;
            imageScalingMode = "center";
            base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
        };
    };
}
