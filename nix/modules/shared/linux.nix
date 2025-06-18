{
  host,
  inputs,
  ...
}:
{
  # Hardware: Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # i18n
  i18n = {
    defaultLocale = "en_NZ.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_NZ.UTF-8";
      LC_IDENTIFICATION = "en_NZ.UTF-8";
      LC_MEASUREMENT = "en_NZ.UTF-8";
      LC_MONETARY = "en_NZ.UTF-8";
      LC_NAME = "en_NZ.UTF-8";
      LC_NUMERIC = "en_NZ.UTF-8";
      LC_PAPER = "en_NZ.UTF-8";
      LC_TELEPHONE = "en_NZ.UTF-8";
      LC_TIME = "en_NZ.UTF-8";
    };
  };

  # Networking
  networking.networkmanager.enable = true;

  # Nix
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  # System: Auto Upgrade
  system.autoUpgrade = {
    dates = "daily";
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
    ];
  };

  # System: State Version
  system.stateVersion = "25.05";

  # Users
  users.users.${host.user} = {
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    isNormalUser = true;
  };
}
