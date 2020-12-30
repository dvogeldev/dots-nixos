{ config, lib, ... }:

with lib;
{
  networking.hosts =
    let hostConfig = {
          "192.168.0.205"  = [ "dv-tp" ];
          "192.168.0.210"  = [ "dv-pc" ];
        };
        hosts = flatten (attrValues hostConfig);
        hostName = config.networking.hostName;
    in mkIf (builtins.elem hostName hosts) hostConfig;

  ## Location config -- since Detroit is my 127.0.0.1
  time.timeZone = mkDefault "America/Detroit";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
  # For redshift, mainly
  location = {
    latitude = 42.48;
    longitude = -85.42;
  };
}
