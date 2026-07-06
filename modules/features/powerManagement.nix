{...}: {
  flake.modules.nixos.powerManagement = {
    services.upower.enable = true;

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
  };
}
