{
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    "${modulesPath}/virtualisation/lxc-container.nix"
    /etc/nixos/configuration.nix
    /etc/nixos/incus.nix
    /etc/nixos/orbstack.nix
    ./services/default.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    nodejs
  ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;

    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}
