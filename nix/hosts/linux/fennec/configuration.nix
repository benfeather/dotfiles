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
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Packages
  environment.systemPackages = with pkgs; [
    "gnomeExtensions.blur-my-shell"
    "gnomeExtensions.dash-to-dock"
    "gnomeExtensions.vitals"
    "gnome-tweaks"
    "heroic"
    "lutris"
    "mangohud"
    "vscode"
    "warp-terminal"
  ];

  # Programs
  programs.firefox.enable = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  # Hardware
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.powerManagement.enable = false;
  hardware.nvidia.powerManagement.finegrained = false;

  # Security
  security.rtkit.enable = true;

  # Services
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.printing.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # System
  system.stateVersion = "25.05";
}
