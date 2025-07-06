{
  virtualisation.oci-containers.containers."sonarr" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    hostname = "sonarr";
    autoStart = true;
    # networks = [
    #   "proxy"
    # ];
    ports = [
      "8989:8989"
    ];
    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sonarr/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sonarr.rule" = "Host(`sonarr.qinglong.orb.local`)";
      "traefik.http.routers.sonarr.entrypoints" = "websecure";
      "traefik.http.services.sonarr.loadbalancer.server.port" = "8989";
    };
  };
}
