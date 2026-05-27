{
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  imports = [
    ./cascade
  ];

  config = lib.mkIf osConfig.features.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.default = {
        isDefault = true;
        settings = {
          # Enable userChrome customizations
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
        };
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          #onepassword-password-manager cant get unfree to work in home manager right now
        ];
      };
    };
    cascade.enable = true;
    stylix.targets.firefox.profileNames = ["default"];
  };
}
