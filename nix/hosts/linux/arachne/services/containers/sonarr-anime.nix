{
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
      "traefik.http.services.sonarr-anime.loadbalancer.server.port" = "8989";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8013:8989"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
