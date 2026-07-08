{self, ...}: {
  flake.modules.nixos.ghostty = {
    home-manager.users.walt.imports = [
      self.modules.homeManager.ghostty
    ];
  };

  flake.modules.homeManager.ghostty = {
    config,
    lib,
    ...
  }: {
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
      systemd.enable = false;
    };

    systemd.user.services."app-com.mitchellh.ghostty" = {
      Unit = {
        Description = "Ghostty";
        After = [
          "graphical-session.target"
          "dbus.socket"
        ];
        Requires = "dbus.socket";
        X-RestartIfChanged = false;
      };
      Service = {
        Type = "dbus";
        BusName = "com.mitchellh.ghostty";
        ReloadSignal = "SIGUSR2";
        ExecStart = "${lib.getExe config.programs.ghostty.package} --gtk-single-instance=true --initial-window=false";
        Restart = "always";
        RestartSec = 1;
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
