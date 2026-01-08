{
  config,
  homeDirectory,
  host,
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

    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };

    timeout = 10;
  };

  # Environment Packages
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.vitals
    gnome-tweaks
    heroic
    libratbag
    lutris
    mangohud
    ntfs3g
    openrgb-with-all-plugins
    piper
    vscode
  ];

  # Hardware: NVIDIA
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    prime.offload.enable = false;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  # Hardware: Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
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

  # System: State Version
  system.stateVersion = "25.11";

  # Users
  users.users.${host.user} = {
    name = host.user;
    shell = pkgs.fish;
    isNormalUser = true;

    # Home Directory
    createHome = true;
    home = homeDirectory;
    homeMode = "700";

    # User Groups
    group = "users";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
