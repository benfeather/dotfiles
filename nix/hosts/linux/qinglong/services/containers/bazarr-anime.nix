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
      "traefik.http.routers.bazarranime.rule" = "Host(`bazarranime.qinglong.orb.local`)";
      "traefik.http.routers.bazarranime.entrypoints" = "websecure";
      "traefik.http.services.bazarranime.loadbalancer.server.port" = "6768";
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
