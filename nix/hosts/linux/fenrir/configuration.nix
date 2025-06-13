{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot Loader (don't touch this future Ben!)
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 5;
  };

  # Environment Packages
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnome-tweaks
    heroic
    libratbag
    lutris
    mangohud
    openrgb-with-all-plugins
    piper
    vscode
    warp-terminal
  ];

  # File Systems
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/3BC9CB1B59C8B846";
    fsType = "ntfs";
    options = [ "x-gvfs-show" ];
  };

  # Hardware
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    prime.offload.enable = false;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  # Programs
  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
  };

  # Programs: Steam
  programs.steam = {
    dedicatedServer.openFirewall = true;
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    extraPackages = with pkgs; [
      gamescope
    ];
  };

  # Security
  security.rtkit.enable = true;

  # Services: Display Manager and Desktop Manager
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # Services: PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Services: Ratbag Daemon
  services.ratbagd.enable = true;

  # System
  system.stateVersion = "25.11";
}
