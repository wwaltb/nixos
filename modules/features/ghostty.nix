{self, ...}: {
  flake.modules.nixos.ghostty = {
    home-manager.users.walt.imports = [
      self.modules.homeManager.ghostty
    ];
  };

  flake.modules.homeManager.ghostty = {
    programs.ghostty = {
      enable = true;
      settings = {
        window-decoration = false;
        window-padding-x = "4";
        window-padding-y = "4";
        resize-overlay = "never";
        working-directory = "home";
        shell-integration = "detect";
      };
    };
  };
}
