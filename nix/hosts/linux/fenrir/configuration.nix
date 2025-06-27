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

    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };

    timeout = 10;
  };

  # Environment Packages
  environment.systemPackages = with pkgs; [
    ghostty
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
    via
    vscode
  ];

  # File Systems
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/3BC9CB1B59C8B846";
    fsType = "ntfs-3g";
    options = [
      "exec"
      "gid=1000"
      "rw"
      "uid=1000"
      "umask=000"
      "user"
    ];
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
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
  };

  # Security
  security.rtkit.enable = true;

  # Services: Display Manager and Desktop Manager
  services.displayManager = {
    gdm.enable = true;
    gnome.enable = true;
  };

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

  # Services: Ratbag Daemon (Mouse Configuration)
  services.ratbagd.enable = true;
}
