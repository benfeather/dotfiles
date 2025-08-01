{
  virtualisation.oci-containers.containers."tailscale" = {
    image = "tailscale/tailscale:latest";
    hostname = "tailscale";

    capabilities = {
      "NET_ADMIN" = true;
      "SYS_MODULE" = true;
    };

    environment = {
      "TS_AUTHKEY" = "tskey-auth-kpsDrYe3J711CNTRL-hRvbzQ7PLvTEPQe8pvjiuTtynYg87X8AQ";
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
