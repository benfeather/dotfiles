{
  virtualisation.oci-containers.containers."traefik" = {
    image = "traefik:v3";
    autoStart = true;
    ports = [
      "80:80"
      "443:443"
      "3000:8080"
    ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
    ];
  };
}
