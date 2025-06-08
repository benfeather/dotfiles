{
  host,
  ...
}:
{
  # Hardware
  hardware.graphics.enable = true;

  # i18n
  i18n.defaultLocale = "en_NZ.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # Nix
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  # Users
  users.users.${host.user} = {
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    isNormalUser = true;
  };
}
