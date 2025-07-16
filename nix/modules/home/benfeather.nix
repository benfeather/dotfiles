{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    ./conf/fish.nix
    ./conf/git.nix
    ./conf/starship.nix
    ./conf/zsh.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };
}
