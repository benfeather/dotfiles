{
  config,
  homeDirectory,
  host,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [
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

  users.users.${host.user} = {
    name = host.user;
    shell = pkgs.fish;
    isSystemUser = true;

    # Home Directory
    createHome = true;
    home = homeDirectory;
    homeMode = "700";

    # User Groups
    group = "users";
    extraGroups = [
      "docker"
      "wheel"
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

  virtualisation.oci-containers = {
    backend = "docker";
  };
}
