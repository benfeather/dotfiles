{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot Loader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 5;
  };

  # File Systems
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/3BC9CB1B59C8B846";
    fsType = "ntfs";
    options = [ "x-gvfs-show" ];
  };

  # Packages
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnome-tweaks
    heroic
    lutris
    mangohud
    vscode
    warp-terminal
  ];

  # Programs
  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
  };

  # Hardware
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  # Security
  security.rtkit.enable = true;

  # Services: PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Services: Printing
  services.printing.enable = true;

  # Services: Wayland/X11
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # System
  system.stateVersion = "25.05";
}
