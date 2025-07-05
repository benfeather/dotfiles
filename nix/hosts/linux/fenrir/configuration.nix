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
      "defaults" # Includes the standard default mount options like rw, suid, dev, exec, auto, nouser, async.
      "uid=1000" # Sets the user ID for all files and directories on the mounted filesystem.
      "gid=100" # Sets the group ID for all files and directories on the mounted filesystem.
      "umask=000" # Controls default file and directory permissions by masking out disallowed bits.
      "dmask=007" # Explicitly sets permissions for newly created directories (e.g., rwxrwx---).
      "fmask=117" # Explicitly sets permissions for newly created files (e.g., rw-rw----).
      "remove_hiberfile" # Automatically removes the hibernation file if found, allowing a clean mount.
      "windows_names" # Prevents the creation of files with names invalid on Windows, improving cross-OS compatibility.
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
