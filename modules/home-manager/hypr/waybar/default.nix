{ config, lib, pkgs, inputs, ... }:
{
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar for hyprland";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
	bar = {
        margin = "4 8 -4 8";

        # Choose the order of the modules
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "idle_inhibitor"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
          "clock"
        ];

        # Modules configuration
        clock = {
          "format" = "{:%I:%M %p}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "  { usage }%";
          tooltip = false;
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-critical = "󰂃 {capacity}%";
          format-icons = [
            "󰂎"
            "󰁻"
            "󰁾"
            "󰂁"
            "󰁹"
          ];
        };
        network = {
          # interface: "wlp2*", # (Optional) To force the use of this interface
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "⚠ Disconnected";
          format-alt = "{ifname}: { ipaddr }/{cidr}";
        };
        pulseaudio = {
          # "scroll-step": 1, // %, can be a float
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons = {
            headphone = " ";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              " "
            ];
          };
          on-click = "pavucontrol";
          ignored-sinks = "easyeffects_sink";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = "";
          activated = "";
          deactivated = "";
        };
        timeout = 90.5;
      };
    };
    };
  };
}
















