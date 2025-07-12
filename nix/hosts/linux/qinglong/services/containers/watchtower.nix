{
  virtualisation.oci-containers.containers."watchtower" = {
    image = "containrrr/watchtower";
    hostname = "watchtower";

    environment = {
      "TZ" = "Pacific/Auckland";
    };

    networks = [
      "proxy"
    ];

    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
  };
}
