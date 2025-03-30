{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./cascade
  ];

  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
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
      };
    };
    cascade.enable = true;
    stylix.targets.firefox.profileNames = ["default"];
  };
}
