{
  virtualisation.oci-containers.containers."duplicati" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    hostname = "duplicati";

    environment = {
      "PUID" = "501";
      "PGID" = "100";
      "TZ" = "Pacific/Auckland";
    };

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.duplicati.rule" = "Host(`duplicati.qinglong.orb.local`)";
      "traefik.http.routers.duplicati.entrypoints" = "websecure";
      "traefik.http.services.duplicati.loadbalancer.server.port" = "8200";
    };

    ports = [
      "8200:8200"
    ];

    volumes = [
      "/mnt/mac/Users/ben/VM-Data/duplicati/config:/config"
      "/mnt/mac/Users/ben/VM-Data:/source"
    ];
  };
}
