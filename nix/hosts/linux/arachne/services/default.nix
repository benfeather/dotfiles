{
  imports = [
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
}
