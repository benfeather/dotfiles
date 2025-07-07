{
  virtualisation.oci-containers.containers."sabnzbd" = {
    image = "lscr.io/linuxserver/sabnzbd:latest";
    hostname = "sabnzbd";
    autoStart = true;

    environment = {
      "PUID" = "1000";
      "PGID" = "1000";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.sabnzbd.rule" = "Host(`sabnzbd.qinglong.orb.local`)";
      "traefik.http.routers.sabnzbd.entrypoints" = "websecure";
      "traefik.http.services.sabnzbd.loadbalancer.server.port" = "8080";
    };

    ports = [
      "8080:8080"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/sabnzbd/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
