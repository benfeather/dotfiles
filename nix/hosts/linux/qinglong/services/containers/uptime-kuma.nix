{
  virtualisation.oci-containers.containers."uptime" = {
    image = "louislam/uptime-kuma:alpine";
    hostname = "uptime";
    autoStart = true;

    environment = {
      "PUID" = "1000";
      "PGID" = "1000";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.uptime.rule" = "Host(`uptime.qinglong.orb.local`)";
      "traefik.http.routers.uptime.entrypoints" = "websecure";
      "traefik.http.services.uptime.loadbalancer.server.port" = "3001";
    };

    ports = [
      "3001:3001"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/uptime/config:/app/data"
    ];
  };
}
