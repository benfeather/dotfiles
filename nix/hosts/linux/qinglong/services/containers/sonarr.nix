{
  virtualisation.oci-containers.containers."sonarr" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    hostname = "sonarr";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sonarr.rule" = "Host(`sonarr.qinglong.orb.local`)";
      "traefik.http.routers.sonarr.entrypoints" = "websecure";
      "traefik.http.services.sonarr.loadbalancer.server.port" = "8989";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8989:8989"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };

  virtualisation.oci-containers.containers."sonarr-anime" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    hostname = "sonarr-anime";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sonarr-anime.rule" = "Host(`sonarr-anime.qinglong.orb.local`)";
      "traefik.http.routers.sonarr-anime.entrypoints" = "websecure";
      "traefik.http.services.sonarr-anime.loadbalancer.server.port" = "8990";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8990:8989"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
