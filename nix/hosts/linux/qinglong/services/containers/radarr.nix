{
  virtualisation.oci-containers.containers."radarr" = {
    image = "lscr.io/linuxserver/radarr:latest";
    hostname = "radarr";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.radarr.rule" = "Host(`radarr.qinglong.orb.local`)";
      "traefik.http.routers.radarr.entrypoints" = "websecure";
      "traefik.http.services.radarr.loadbalancer.server.port" = "7878";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "7878:7878"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/radarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };

  virtualisation.oci-containers.containers."radarr-anime" = {
    image = "lscr.io/linuxserver/radarr:latest";
    hostname = "radarr-anime";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.radarr-anime.rule" = "Host(`radarr-anime.qinglong.orb.local`)";
      "traefik.http.routers.radarr-anime.entrypoints" = "websecure";
      "traefik.http.services.radarr-anime.loadbalancer.server.port" = "7879";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "7879:7878"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/radarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
