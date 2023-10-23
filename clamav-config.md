# test no.1
```
  security.sudo.extraConfig  =
  ''
     clamav ALL = (ALL) NOPASSWD: SETENV: /run/current-system/sw/bin/notify-send
  '';
  #clamav
  services.clamav.updater.enable = true;
  services.clamav.daemon.enable = true;
  services.clamav.daemon.settings = {
    OnAccessMountPath = "/home/gentoober/";
    OnAccessPrevention = false;
    OnAccessExtraScanning = true;
    OnAccessExcludeUname =  "clamav";
    VirusEvent = "/etc/clamav/virus-event.bash";
    User = "clamav";
  };
```
