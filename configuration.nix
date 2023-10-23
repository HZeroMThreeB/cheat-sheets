# gentoober's - Thu Oct 19 11:58:55 AM -03 2023 - /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "2da21e19";

fileSystems = {
  "/".options = [ "relatime" "compress=zstd:3" "ssd" "space_cache=v2" ];
  "/home".options = [ "relatime" "compress=zstd:3" "ssd" "space_cache=v2" ];
  "/nix".options = [ "compress=zstd:3" "ssd" "space_cache=v2" "noatime" ];
};

services.btrfs.autoScrub = {
  enable = true;
  interval = "monthly";
  fileSystems = [ "/" ];
};

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  nixpkgs.config.allowBroken = true;
  virtualisation.docker.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  #  i18n.defaultLocale = "en_US.UTF-8";
  #  console = {
  #    font = "Lat2-Terminus16";
  #    keyMap = "br-abnt2";
  #    useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome.gnome-music pkgs.gnome-photos pkgs.gnome.geary pkgs.epiphany pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour ];
  
  # DWM configuration:
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = /home/gentoober/.config/suckless/dwm;
  };
  
  # Configure DWM custom packages within the DWM configuration:
  #services.xserver.windowManager.dwm.dwmblocks.enable = true;
  #services.xserver.windowManager.dwmblocks.package = pkgs.dwm.overrideAttrs {
  #  src = /home/gentoober/.config/suckless/dwmblocks;
  #};

   # Configure keymap in X11
   services.xserver.layout = "br";
   services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gentoober = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [ dmenu dwmblocks nitrogen librewolf firefox brave pass hexchat telegram-desktop obs-studio kdenlive audacity ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ procps coreutils vim wget git mtr curl gnupg nmap nettools iproute2 tree exa cargo docker clamav mpv pkgs.gnome.gnome-tweaks htop gotop dstat highlight parted lz4 zstd lzo dig tcpdump traceroute tor light redshift pavucontrol binwalk pkgs.timer ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;
  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

# ClamAV gentoober Edition

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

}
