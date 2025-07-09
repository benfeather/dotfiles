{
  virtualisation.oci-containers.containers."bazarr-anime" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr-anime";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr-anime.rule" = "Host(`bazarr-anime.qinglong.orb.local`)";
      "traefik.http.routers.bazarr-anime.entrypoints" = "websecure";
      "traefik.http.services.bazarr-anime.loadbalancer.server.port" = "6767";
    };

    ports = [
      "8001:6767"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/bazarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
