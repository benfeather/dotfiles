{
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr";

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

    networks = [
      "proxy"
    ];

    ports = [
      "8002:6767"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/bazarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
