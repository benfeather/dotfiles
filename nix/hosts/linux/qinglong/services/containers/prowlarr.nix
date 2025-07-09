{
  virtualisation.oci-containers.containers."prowlarr" = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    hostname = "prowlarr";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.prowlarr.rule" = "Host(`prowlarr.qinglong.orb.local`)";
      "traefik.http.routers.prowlarr.entrypoints" = "websecure";
      "traefik.http.services.prowlarr.loadbalancer.server.port" = "9696";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "9696:9696"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/prowlarr/config:/config"
    ];
  };
}
