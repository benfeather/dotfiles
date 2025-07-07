{
  virtualisation.oci-containers.containers."lidarr" = {
    image = "lscr.io/linuxserver/lidarr:latest";
    hostname = "lidarr";
    autoStart = true;

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

    ports = [
      "7878:7878"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/lidarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
