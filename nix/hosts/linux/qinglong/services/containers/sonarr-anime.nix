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
      "traefik.http.routers.sonarranime.rule" = "Host(`sonarranime.qinglong.orb.local`)";
      "traefik.http.routers.sonarranime.entrypoints" = "websecure";
      "traefik.http.services.sonarranime.loadbalancer.server.port" = "8990";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8990:8989"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
