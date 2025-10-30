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
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix

    # Scripts
    ./scripts/nix-rebuild.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };
}
