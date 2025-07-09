{
  virtualisation.oci-containers.containers."fileflows" = {
    image = "revenz/fileflows";
    hostname = "fileflows";

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
      "traefik.http.services.fileflows.loadbalancer.server.port" = "8003";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8003:5000"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/fileflows/data:/app/Data"
      "/mnt/mac/Users/ben/VM-Data/fileflows/logs:/app/Logs"
      "/mnt/mac/Users/ben/VM-Data/fileflows/temp:/temp"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
