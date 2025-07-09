{
  virtualisation.oci-containers.containers."radarr-anime" = {
    image = "lscr.io/linuxserver/radarr:latest";
    hostname = "radarr-anime";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.radarranime.rule" = "Host(`radarranime.qinglong.orb.local`)";
      "traefik.http.routers.radarranime.entrypoints" = "websecure";
      "traefik.http.services.radarranime.loadbalancer.server.port" = "7879";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "7879:7878"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/radarr-anime/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
