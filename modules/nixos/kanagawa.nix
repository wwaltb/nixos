{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.features.kanagawa.enable {
    stylix = {
      enable = true;
      image = ../../assets/bus-wallpaper.png;
      imageScalingMode = "center";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";

      # should probably decouple this with general stylix options
      cursor = {
        package = pkgs.hackneyed;
        name = "Hackneyed";
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.fira-mono;
          name = "Fira Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
      };

      targets.gtksourceview.enable = false;
    };
  };
}
