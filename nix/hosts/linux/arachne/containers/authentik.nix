{
  config,
  ...
}:
let
  env = import ../utils/env.nix;
in
{
  virtualisation.oci-containers.containers = {
    "authentik-server" = {
      image = "ghcr.io/goauthentik/server:latest";
      hostname = "authentik-server";
      cmd = [ "server" ];

      environment = {
        "AUTHENTIK_SECRET_KEY" = "secret";
        "AUTHENTIK_REDIS__HOST" = "authentik-redis";
        "AUTHENTIK_POSTGRESQL__HOST" = "postgresql";
        "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
        "AUTHENTIK_POSTGRESQL__USER" = config.sops.placeholder."global/pg_db_user";
        "AUTHENTIK_POSTGRESQL__PASSWORD" = config.sops.placeholder."global/pg_db_pass";
        "TZ" = env.tz;
      };

      networks = [
        "proxy"
      ];

      ports = [
        "9000:9000"
        "9443:9443"
      ];

      volumes = [
        "/mnt/mac/Users/ben/VM-Data/authentik/media:/media"
        "/mnt/mac/Users/ben/VM-Data/authentik/custom-templates:/templates"
      ];
    };

    "authentik-worker" = {
      image = "ghcr.io/goauthentik/server:latest";
      hostname = "authentik-worker";
      cmd = [ "worker" ];

      environment = {
        "AUTHENTIK_SECRET_KEY" = "changeme";
        "AUTHENTIK_REDIS__HOST" = "authentik-redis";
        "AUTHENTIK_POSTGRESQL__HOST" = "postgres";
        "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
        "AUTHENTIK_POSTGRESQL__USER" = config.sops.placeholder."global/pg_db_user";
        "AUTHENTIK_POSTGRESQL__PASSWORD" = config.sops.placeholder."global/pg_db_pass";
        "TZ" = env.tz;
      };

      networks = [
        "proxy"
      ];

      volumes = [
        "/mnt/mac/Users/ben/VM-Data/authentik/media:/media"
        "/mnt/mac/Users/ben/VM-Data/authentik/certs:/certs"
        "/mnt/mac/Users/ben/VM-Data/authentik/custom-templates:/templates"
        "/var/run/docker.sock:/var/run/docker.sock"
      ];
    };

    "authentik-redis" = {
      image = "docker.io/library/redis:alpine";
      hostname = "authentik-redis";

      environment = {
        "TZ" = env.tz;
      };

      networks = [
        "proxy"
      ];

      volumes = [
        "/mnt/mac/Users/ben/VM-Data/authentik/redis:/data"
      ];
    };
  };
}
