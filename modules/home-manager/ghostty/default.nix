{ config, lib, pkgs, inputs, ... }:
{ 
	options = {
		ghostty.enable = lib.mkEnableOption "enables ghostty";
	};

	config = lib.mkIf config.ghostty.enable {
		programs.ghostty = {
			enable = true;
			enableFishIntegration = true;
			settings = {
				window-decoration = false;
			};

		};
	};
}
