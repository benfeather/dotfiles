{
  virtualisation.oci-containers.containers."tailscale" = {
    image = "tailscale/tailscale:latest";
    hostname = "tailscale";

    capabilities = [
      "NET_ADMIN"
    ];

    environment = {
      "TS_AUTHKEY" = "";
      "TS_EXTRA_ARGS" = "--advertise-tags=tag:container";
      "TS_STATE_DIR" = "/config";
      "TS_USERSPACE" = false;
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.tailscale.rule" = "Host(`tailscale.qinglong.orb.local`)";
      "traefik.http.routers.tailscale.entrypoints" = "websecure";
      "traefik.http.services.tailscale.loadbalancer.server.port" = "7878";
    };

    networks = [
      "host"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/tailscale/config:/config"
    ];
  };
}
