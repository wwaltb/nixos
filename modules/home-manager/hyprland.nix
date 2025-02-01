{ config, lib, pkgs, inputs, ... }:
{ 
	options = {
		hyprland.enable = lib.mkEnableOption "enables hyprland";
	};

	config = lib.mkIf config.hyprland.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			settings = {
				general = {
					"col.active_border" = "rgba(${config.colorScheme.colors.base06}ff)";
					"col.inactive_border" = "rgba(${config.colorScheme.colors.base03}ff)";

				};

				animations = {
					enabled = false;
				};

			};
		};
	};
}
