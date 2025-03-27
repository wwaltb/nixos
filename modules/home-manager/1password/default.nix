{ config, lib, pkgs, inputs, ... }:
{
  options = {
    _1password.enable = lib.mkEnableOption "enables 1password cli and gui";
  };

  config = lib.mkIf config._1password.enable {
    # programs._1password.enable = true;
    # programs._1password-gui.enable = true;
  };
}
