{
  config,
  ...
}:
{
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr";

    environment = {
      "PUID" = config.sops.secrets."global/puid";
      "PGID" = config.sops.secrets."global/pgid";
      "TZ" = config.sops.secrets."global/tz";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr.rule" = "Host(`bazarr.${config.sops.secrets."global/domain"}`)";
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
      "${config.sops.secrets."global/data_dir"}/bazarr/config:/config"
      "${config.sops.secrets."global/data_dir"}/media:/data"
    ];
  };
}
