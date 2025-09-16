{
  config,
  lib,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "steam configuration";
  };

  config = lib.mkIf config.nvidia.enable {
    programs.nvidia = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
