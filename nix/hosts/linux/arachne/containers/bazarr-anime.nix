{
  config,
  ...
}:
{
  virtualisation.oci-containers.containers."bazarr-anime" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr-anime";

    environment = {
      "PUID" = config.sops.placeholder."global/puid";
      "PGID" = config.sops.placeholder."global/pgid";
      "TZ" = config.sops.placeholder."global/tz";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr-anime.rule" = "Host(`bazarr-anime.${
        config.sops.placeholder."global/domain"
      }`)";
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
