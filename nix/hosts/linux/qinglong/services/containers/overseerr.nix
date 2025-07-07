{
  virtualisation.oci-containers.containers."overseerr" = {
    image = "lscr.io/linuxserver/overseerr:latest";
    hostname = "overseerr";
    autoStart = true;

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.overseerr.rule" = "Host(`overseerr.qinglong.orb.local`)";
      "traefik.http.routers.overseerr.entrypoints" = "websecure";
      "traefik.http.services.overseerr.loadbalancer.server.port" = "5055";
    };

    ports = [
      "5055:5055"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/overseerr/config:/config"
    ];
  };
}
