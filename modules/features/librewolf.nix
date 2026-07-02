{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.librewolf = {
    home-manager.users.walt.imports = [
      self.modules.homeManager.librewolf
    ];
  };

  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      profiles.walt = {
        isDefault = true;
        settings = {
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          "browser.toolbars.bookmarks.visibility" = "never"; # "newtab"
        };

        extensions = {
          force = true;
        };
      };
    };

    stylix.targets.librewolf.profileNames = ["walt"];
    stylix.targets.librewolf.colorTheme.enable = true;
  };
}
