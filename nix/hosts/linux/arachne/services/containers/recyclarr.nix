{
  virtualisation.oci-containers.containers."recyclarr" = {
    image = "recyclarr/recyclarr:latest";
    hostname = "recyclarr";

    environment = {
      "TZ" = "Pacific/Auckland";
    };

    networks = [
      "proxy"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/recyclarr/config:/config"
    ];
  };
}
