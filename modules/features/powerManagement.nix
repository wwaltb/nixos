{...}: {
  flake.modules.nixos.powerManagement = {
    powerManagement.enable = true;

    services.upower.enable = true;

    services.thermald.enable = true;
    services.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";

          # requires kernel module loaded (i.e. thinkpad_acpi), but these
          # should be enabled by default
          # enable_thresholds = "true";
          # start_threshold = "40";
          # stop_threshold = "80";
        };

        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    # enable hibernation after suspending and from power key
    services.logind = {
      enable = true;
      settings.Login = {
        LidSwitch = "suspend-then-hibernate";
        PowerKey = "hibernate";
        PowerKeyLongPress = "poweroff";
      };
    };

    systemd.sleep.settings.Sleep = {
      HibernateDelaySec = "60m";
      SuspendState = "mem";
    };
  };
}
