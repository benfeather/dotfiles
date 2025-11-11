{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    # Programs
    ./programs/fish.nix
    # ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix

    # Scripts
    ./scripts/nix-rebuild.nix
    ./scripts/nix-upgrade.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };
}
