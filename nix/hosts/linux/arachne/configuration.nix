{
  config,
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    # Services
    ./containers/authentik.nix
    ./containers/bazarr-anime.nix
    ./containers/bazarr.nix
    ./containers/duplicati.nix
    ./containers/fileflows.nix
    ./containers/homepage.nix
    ./containers/huntarr.nix
    ./containers/jellyfin.nix
    ./containers/lidarr.nix
    ./containers/overseerr.nix
    ./containers/plex.nix
    ./containers/prowlarr.nix
    ./containers/radarr-anime.nix
    ./containers/radarr.nix
    ./containers/recyclarr.nix
    ./containers/sabnzbd.nix
    ./containers/sonarr-anime.nix
    ./containers/sonarr.nix
    ./containers/tailscale.nix
    ./containers/traefik.nix
    ./containers/uptime-kuma.nix

    # Utilities
    ./utils/network-init.nix
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      3000
    ];
  };

  # sops = {
  #   age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
  #   secrets = {
  #     "global/data_dir".sopsFile = ./secrets.yaml;
  #     "global/domain".sopsFile = ./secrets.yaml;
  #     "global/puid".sopsFile = ./secrets.yaml;
  #     "global/pgid".sopsFile = ./secrets.yaml;
  #     "global/tz".sopsFile = ./secrets.yaml;
  #   };
  #   placeholder = {
  #     "global/data_dir" = config.sops.secrets."global/data_dir".path;
  #     "global/domain" = config.sops.secrets."global/domain".path;
  #     "global/puid" = config.sops.secrets."global/puid".path;
  #     "global/pgid" = config.sops.secrets."global/pgid".path;
  #     "global/tz" = config.sops.secrets."global/tz".path;
  #   };
  # };

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
