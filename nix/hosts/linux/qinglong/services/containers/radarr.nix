{
  virtualisation.oci-containers.containers."radarr" = {
    image = "ghcr.io/linuxserver/radarr:latest";
    autoStart = true;
    restartPolicy = "always";
    ports = [
      "7878:7878"
    ];
    # volumes = [
    #   "/mnt/data/radarr/config:/config"
    #   "/mnt/data/radarr/downloads:/downloads"
    #   "/mnt/data/radarr/movies:/movies"
    # ];
  };
}
