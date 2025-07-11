{
  virtualisation.oci-containers.containers."huntarr" = {
    image = "huntarr/huntarr:latest";
    hostname = "huntarr";

    environment = {
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.huntarr.rule" = "Host(`huntarr.qinglong.orb.local`)";
      "traefik.http.routers.huntarr.entrypoints" = "websecure";
      "traefik.http.services.huntarr.loadbalancer.server.port" = "9705";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8004:9705"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/huntarr/config:/config"
    ];
  };
}
