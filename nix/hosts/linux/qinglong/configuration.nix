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

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      3000
    ];
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}
