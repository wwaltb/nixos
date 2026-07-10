{inputs, ...}: {
  flake.modules.nixos.niri = {pkgs, ...}: {
    imports = [inputs.niri.nixosModules.niri];
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    programs.niri = {
      enable = true;
      package = pkgs.niri-stable;
    };

    home-manager.users.walt.imports = [
      inputs.self.modules.homeManager.niri
    ];
  };

  flake.modules.homeManager.niri = {
    config,
    lib,
    pkgs,
    ...
  }: let
    system = pkgs.stdenv.hostPlatform.system;
    noctaliaExe = lib.getExe inputs.noctalia.packages.${system}.default;
  in {
    # disable stylix's auto niri theming since we're setting colors manually
    stylix.targets.niri.enable = false;

    programs.niri.settings = {
      spawn-at-startup = [
        {command = [noctaliaExe];}
      ];

      layout = {
        gaps = 6;

        focus-ring.enable = false;
        border = {
          enable = true;
          width = 3;
          active.color = "#${config.lib.stylix.colors.base06}";
          inactive.color = "#${config.lib.stylix.colors.base03}";
          urgent.color = "#${config.lib.stylix.colors.base08}";
        };

        background-color = "#${config.lib.stylix.colors.base00}";

        empty-workspace-above-first = true;

        preset-column-widths = [
          {proportion = 0.333333;}
          {proportion = 0.5;}
          {proportion = 0.666667;}
          {proportion = 1.0;}
        ];

        default-column-width = {proportion = 0.5;};

        preset-window-heights = [
          {proportion = 0.333333;}
          {proportion = 0.5;}
          {proportion = 0.666667;}
          {proportion = 1.0;}
        ];
      };

      overview.backdrop-color = "#${config.lib.stylix.colors.base01}";

      window-rules = [
        {
          matches = [{}];
          geometry-corner-radius = {
            top-left = 4.0;
            top-right = 4.0;
            bottom-left = 4.0;
            bottom-right = 4.0;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
      ];

      animations.enable = false;

      gestures.hot-corners.enable = false;

      hotkey-overlay.skip-at-startup = true;

      cursor.hide-after-inactive-ms = 500;

      input.power-key-handling.enable = false;

      binds = with config.lib.niri.actions; {
        "Mod+D".action = close-window;

        "Mod+Space".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "launcher"
        ];
        "Mod+C".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "clipboard"
        ];
        "Mod+B".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "control-center"
          "bluetooth"
        ];
        "Mod+N".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "control-center"
          "network"
        ];
        "Mod+Shift+B".action.spawn = [noctaliaExe "msg" "bar-toggle"];
        "Mod+Semicolon".action.spawn = [
          (lib.getExe pkgs.ghostty)
          "+new-window"
        ];
        "Mod+Shift+Semicolon".action.spawn = [
          (lib.getExe pkgs.librewolf)
        ];

        "Mod+H".action = focus-column-or-monitor-left;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+L".action = focus-column-or-monitor-right;

        "Mod+Ctrl+H".action.focus-column = 1;
        "Mod+Ctrl+J".action.focus-column = 2;
        "Mod+Ctrl+K".action.focus-column = 3;
        "Mod+Ctrl+L".action.focus-column = 4;
        "Mod+Ctrl+Semicolon".action.focus-column = 5;

        "Mod+Shift+H".action = consume-or-expel-window-left;
        "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
        "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
        "Mod+Shift+L".action = consume-or-expel-window-right;

        "Mod+Shift+Alt+H".action = switch-preset-column-width-back;
        "Mod+Shift+Alt+J".action = switch-preset-window-height-back;
        "Mod+Shift+Alt+K".action = switch-preset-window-height;
        "Mod+Shift+Alt+L".action = switch-preset-column-width;

        "XF86AudioMute".action.spawn = [
          noctaliaExe
          "msg"
          "volume-mute"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          noctaliaExe
          "msg"
          "volume-down"
        ];
        "XF86AudioRaiseVolume".action.spawn = [
          noctaliaExe
          "msg"
          "volume-up"
        ];
        "XF86AudioMicMute".action.spawn = [
          noctaliaExe
          "msg"
          "mic-mute"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          noctaliaExe
          "msg"
          "brightness-down"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          noctaliaExe
          "msg"
          "brightness-up"
        ];
        # "XF86Display".action.spawn = [];
        "XF86WLAN".action.spawn = [noctaliaExe "msg" "wifi-toggle"];

        # F9
        "XF86Tools".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "control-center"
        ];
        "XF86NotificationCenter".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "control-center"
        ];
        # F10
        "XF86Search".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "launcher"
        ];
        "XF86PickupPhone".action.spawn = [
          noctaliaExe
          "msg"
          "panel-toggle"
          "launcher"
        ];
        # F11
        # "XF86LaunchA".action.spawn = [];
        # "XF86HangupPhone".action.spawn = [];
        # F12
        "XF86Explorer".action = toggle-overview;
        "XF86Favorites".action = toggle-overview;
      };
    };
  };
}
