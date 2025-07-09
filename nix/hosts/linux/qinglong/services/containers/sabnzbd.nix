{
  virtualisation.oci-containers.containers."sabnzbd" = {
    image = "lscr.io/linuxserver/sabnzbd:latest";
    hostname = "sabnzbd";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sabnzbd.rule" = "Host(`sabnzbd.qinglong.orb.local`)";
      "traefik.http.routers.sabnzbd.entrypoints" = "websecure";
      "traefik.http.services.sabnzbd.loadbalancer.server.port" = "8080";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8012:8080"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sabnzbd/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
