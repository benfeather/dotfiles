{
  virtualisation.oci-containers.containers."plex" = {
    image = "lscr.io/linuxserver/plex:latest";
    hostname = "plex";

    # devices = [
    #   "/dev/dri:/dev/dri"
    # ];

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
      "PLEX_CLAIM" = "claim-xxxxxx";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.plex.rule" = "Host(`plex.qinglong.orb.local`)";
      "traefik.http.routers.plex.entrypoints" = "websecure";
      "traefik.http.services.plex.loadbalancer.server.port" = "8008";
    };

    networks = [
      "proxy"
    ];

    ports = [
      "8008:32400"
      "1900:1900"
      "5353:5353/udp"
      "8324:8324"
      "32410:32410/udp"
      "32412:32412/udp"
      "32413:32413/udp"
      "32414:32414/udp"
      "32469:32469"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/plex/config:/config"
      "/mnt/mac/Users/ben/VM-Data/media:/data"
    ];
  };
}
