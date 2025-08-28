{
  config,
  ...
}:
{
  virtualisation.oci-containers.containers."bazarr-anime" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "bazarr-anime";

    environment = {
      "PUID" = "${config.sops.secrets."global/puid"}";
      "PGID" = "${config.sops.secrets."global/pgid"}";
      "TZ" = "${config.sops.secrets."global/tz"}";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.bazarr-anime.rule" = "Host(`bazarr-anime.${
        config.sops.secrets."global/domain"
      }`)";
      "traefik.http.routers.bazarr-anime.entrypoints" = "websecure";
      "traefik.http.services.bazarr-anime.loadbalancer.server.port" = "6767";
    };

    ports = [
      "8001:6767"
    ];

    volumes = [
      "${config.sops.secrets."global/data_dir"}/bazarr-anime/config:/config"
      "${config.sops.secrets."global/data_dir"}/media:/data"
    ];
  };
}
