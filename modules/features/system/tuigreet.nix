{...}: {
  flake.modules.nixos.tuigreet = {
    config,
    lib,
    pkgs,
    ...
  }: {
    services.greetd = let
      tuigreet = "${lib.getExe pkgs.tuigreet}";
      sessions = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      theme = lib.concatStringsSep ";" [
        "container=black"
        "border=bright-black"
        # "text=white"
        # "time=white"
        "prompt=green"
        "input=red"
        # "action=white"
        "button=blue"
      ];
    in {
      enable = true;
      settings = {
        default_session = {
          command = lib.concatStringsSep " " [
            tuigreet
            "--remember"
            "--remember-user-session"

            "--asterisks"
            "--window-padding 1"

            "--time"
            ''--time-format "%A, %d %B %Y - %I:%M %p"''

            ''--theme "${theme}"''

            "--sessions ${sessions}"
          ];
          user = "greeter";
        };
      };
      # useTextGreeter = true;
    };

    systemd.tmpfiles.rules = [
      "d /var/cache/tuigreet 0755 greeter greeter -"
    ];
  };
}
