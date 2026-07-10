{self, ...}: {
  flake.modules.nixos.git = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.git
    ];

    home-manager.users.walt.imports = [
      self.modules.homeManager.git
    ];
  };

  flake.modules.homeManager.git = {...}: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "wwaltb";
          email = "wwaltb@proton.me";
        };
        pull.rebase = "false";
        init.defaultbranch = "main";
      };
    };
  };
}
