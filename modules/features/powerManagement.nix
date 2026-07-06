{...}: {
  flake.modules.nixos.powerManagement = {
    services.upower.enable = true;

    services.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
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

    # required for battery thresholds to work
    boot.kernelModules = ["thinkpad_acpi"];
  };
}
