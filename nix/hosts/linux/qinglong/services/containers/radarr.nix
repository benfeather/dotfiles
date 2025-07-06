{
  virtualisation.oci-containers.containers."radarr" = {
    image = "lscr.io/linuxserver/radarr:latest";
    hostname = "radarr";
    autoStart = true;
    networks = [
      "proxy"
    ];
    ports = [
      "7878:7878"
    ];
    volumes = [
      "/mnt/mac/Users/ben/VM-Data/radarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.radarr.rule" = "Host(`radarr.qinglong.orb.local`)";
      "traefik.http.routers.radarr.entrypoints" = "websecure";
      "traefik.http.services.radarr.loadbalancer.server.port" = "7878";
    };
  };
}
