{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    "${fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master"}/modules/vscode-server/home.nix"
    ./conf/fish.nix
    ./conf/git.nix
    ./conf/starship.nix
    ./conf/zsh.nix
  ];

  services.vscode-server.enable = true;

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };
}
