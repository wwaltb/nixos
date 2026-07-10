{...}: {
  flake.modules.nixos.powerManagement = {lib, ...}: {
    powerManagement.enable = true;

    # battery reporting and low battery thresholds
    services.upower = {
      enable = true;

      criticalPowerAction = "Hibernate";
      percentageLow = 20;
      percentageCritical = 15;
      percentageAction = 8;
    };

    # allow upower to hibernate through systemd
    systemd.services.upower.serviceConfig = {
      ProtectSystem = lib.mkForce "no";
      PrivateTmp = lib.mkForce false;
    };

    # cpu management
    services.thermald.enable = true;
    services.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";

          # requires kernel module loaded (i.e. thinkpad_acpi), but these
          # should be enabled by default
          enable_thresholds = "true";
          start_threshold = "40";
          stop_threshold = "80";
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
        HandleLidSwitch = "suspend-then-hibernate";
        HandlePowerKey = "hibernate";
        HandlePowerKeyLongPress = "poweroff";
      };
    };

    systemd.sleep.settings.Sleep = {
      HibernateDelaySec = "90m";
      SuspendState = "mem";
    };

    # enable deep sleep on suspend
    boot.kernelParams = ["mem_sleep_default=deep"];
  };
}
