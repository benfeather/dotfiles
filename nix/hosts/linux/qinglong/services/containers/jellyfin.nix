{
  virtualisation.oci-containers.containers."jellyfin" = {
    image = "lscr.io/linuxserver/jellyfin:latest";
    hostname = "jellyfin";

    # devices = [
    #   "/dev/dri:/dev/dri"
    # ];

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.jellyfin.rule" = "Host(`jellyfin.qinglong.orb.local`)";
      "traefik.http.routers.jellyfin.entrypoints" = "websecure";
      "traefik.http.services.jellyfin.loadbalancer.server.port" = "8096";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8096:8096" # HTTP access
      "7359:7359/udp" # Local network discovery
      "1900:1900/udp" # DNLA discovery
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/jellyfin/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
