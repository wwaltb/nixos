{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.kanagawa = { pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;
      image = ./bus-wallpaper.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    };
  };
}
