{
  virtualisation.oci-containers.containers."sonarr" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    hostname = "sonarr";
    autoStart = true;

    environment = {
      "PUID" = "1000";
      "PGID" = "1000";
      "TZ" = "Pacific/Auckland";
    };

    ports = [
      "8989:8989"
    ];

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sonarr.rule" = "Host(`sonarr.qinglong.orb.local`)";
      "traefik.http.routers.sonarr.entrypoints" = "websecure";
      "traefik.http.services.sonarr.loadbalancer.server.port" = "8989";
    };

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };

  virtualisation.oci-containers.containers."sonarr-anime" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    hostname = "sonarr-anime";
    autoStart = true;

    environment = {
      "PUID" = "1000";
      "PGID" = "1000";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sonarr-anime.rule" = "Host(`sonarr-anime.qinglong.orb.local`)";
      "traefik.http.routers.sonarr-anime.entrypoints" = "websecure";
      "traefik.http.services.sonarr-anime.loadbalancer.server.port" = "8990";
    };

    ports = [
      "8990:8989"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
