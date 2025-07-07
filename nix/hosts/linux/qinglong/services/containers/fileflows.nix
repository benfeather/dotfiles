{
  virtualisation.oci-containers.containers."fileflows" = {
    image = "revenz/fileflows";
    hostname = "fileflows";
    autoStart = true;

    # devices = [
    #   "/dev/dri:/dev/dri"
    # ];

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.fileflows.rule" = "Host(`fileflows.qinglong.orb.local`)";
      "traefik.http.routers.fileflows.entrypoints" = "websecure";
      "traefik.http.services.fileflows.loadbalancer.server.port" = "5000";
    };

    ports = [
      "5000:5000"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/fileflows/config:/app"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
