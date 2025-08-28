{
  virtualisation.oci-containers.containers."homepage" = {
    image = "ghcr.io/gethomepage/homepage:latest";
    hostname = "homepage";

    environment = {
      "HOMEPAGE_ALLOWED_HOSTS" = "homepage.qinglong.orb.local";
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.homepage.rule" = "Host(`homepage.qinglong.orb.local`)";
      "traefik.http.routers.homepage.entrypoints" = "websecure";
      "traefik.http.services.homepage.loadbalancer.server.port" = "3000";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8016:3000"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/homepage/config:/app/config"
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
  };
}
