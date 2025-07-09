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
    enable = false;
    allowedTCPPorts = [
      80
      443
      3000
    ];
  };

  systemd.services.network-init = {
    serviceConfig.Type = "oneshot";

    wantedBy = [
      "docker-my-container.service"
    ];

    script = ''
      ${pkgs.docker}/bin/docker network inspect proxy || \
      ${pkgs.docker}/bin/docker network create --driver="bridge" proxy

      ${pkgs.docker}/bin/docker network inspect host || \
      ${pkgs.docker}/bin/docker network create --driver="host" host
    '';
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  virtualisation.oci-containers = {
    backend = "docker";
  };
}
