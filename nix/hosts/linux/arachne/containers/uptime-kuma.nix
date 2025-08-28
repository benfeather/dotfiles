{
  virtualisation.oci-containers.containers."uptime" = {
    image = "louislam/uptime-kuma:alpine";
    hostname = "uptime";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.uptime.rule" = "Host(`uptime.qinglong.orb.local`)";
      "traefik.http.routers.uptime.entrypoints" = "websecure";
      "traefik.http.services.uptime.loadbalancer.server.port" = "3001";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8015:3001"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/uptime/config:/app/data"
    ];
  };
}
