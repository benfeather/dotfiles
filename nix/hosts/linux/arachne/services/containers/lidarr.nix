{
  virtualisation.oci-containers.containers."lidarr" = {
    image = "lscr.io/linuxserver/lidarr:latest";
    hostname = "lidarr";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.lidarr.rule" = "Host(`lidarr.qinglong.orb.local`)";
      "traefik.http.routers.lidarr.entrypoints" = "websecure";
      "traefik.http.services.lidarr.loadbalancer.server.port" = "7878";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8006:7878"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/lidarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
