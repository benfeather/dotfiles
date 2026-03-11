{
  homeDirectory,
  host,
  ...
}:
{
  imports = [
    # Programs
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix

    # Scripts
    ./scripts/nix-rebuild.nix
    ./scripts/nix-upgrade.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.11";
    username = host.user;
  };
}
