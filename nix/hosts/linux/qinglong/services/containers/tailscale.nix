{
  virtualisation.oci-containers.containers."tailscale" = {
    image = "tailscale/tailscale:latest";
    hostname = "tailscale";

    capabilities = {
      "NET_ADMIN" = true;
    };

    environment = {
      "TS_AUTHKEY" = "";
      "TS_EXTRA_ARGS" = "--advertise-tags=tag:container";
      "TS_STATE_DIR" = "/config";
      "TS_USERSPACE" = "false";
    };

    networks = [
      "host"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/tailscale/config:/config"
    ];
  };
}
