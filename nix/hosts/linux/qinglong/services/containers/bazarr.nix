{
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr";
    autoStart = true;

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr.rule" = "Host(`bazarr.qinglong.orb.local`)";
      "traefik.http.routers.bazarr.entrypoints" = "websecure";
      "traefik.http.services.bazarr.loadbalancer.server.port" = "6767";
    };

    ports = [
      "6767:6767"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/bazarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };

  virtualisation.oci-containers.containers."bazarr-anime" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr-anime";
    autoStart = true;

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr-anime.rule" = "Host(`bazarr-anime.qinglong.orb.local`)";
      "traefik.http.routers.bazarr-anime.entrypoints" = "websecure";
      "traefik.http.services.bazarr-anime.loadbalancer.server.port" = "6768";
    };

    ports = [
      "6768:6767"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/bazarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
