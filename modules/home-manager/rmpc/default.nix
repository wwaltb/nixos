{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.rmpc.enable {
    programs.rmpc = {
      enable = true;
      config = ''
        (
          address: "100.89.199.66:6600"
        )
      '';
    };
  };
}
