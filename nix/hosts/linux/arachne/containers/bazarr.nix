{
  config,
  ...
}:
let
  env = import ../utils/env.nix;
in
{
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr";

    environment = {
      "PUID" = config.sops.placeholder."global/puid";
      "PGID" = config.sops.placeholder."global/pgid";
      "TZ" = env.tz;
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr.rule" = "Host(`bazarr.${env.domain}`)";
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
