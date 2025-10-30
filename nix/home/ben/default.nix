{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };
}
