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
  ];

  # Environment Packages
  environment.systemPackages = with pkgs; [
    git
    nodejs
  ];
}
