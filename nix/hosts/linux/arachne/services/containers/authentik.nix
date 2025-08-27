{
  virtualisation.oci-containers.containers = {
    "authentik-server" = {
      image = "ghcr.io/goauthentik/server:latest";
      hostname = "authentik-server";
      cmd = [ "server" ];

      environment = {
        "AUTHENTIK_SECRET_KEY" = "secret";
        "AUTHENTIK_REDIS__HOST" = "authentik-redis";
        "AUTHENTIK_POSTGRESQL__HOST" = "authentik-postgresql";
        "AUTHENTIK_POSTGRESQL__USER" = "authentik";
        "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
        "AUTHENTIK_POSTGRESQL__PASSWORD" = "authentik";
        "TZ" = "Pacific/Auckland";
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
        "AUTHENTIK_POSTGRESQL__HOST" = "authentik-postgres";
        "AUTHENTIK_POSTGRESQL__USER" = "authentik";
        "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
        "AUTHENTIK_POSTGRESQL__PASSWORD" = "changeme";
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

    "authentik-postgres" = {
      image = "docker.io/library/postgres:alpine";
      hostname = "authentik-postgres";

      environment = {
        "POSTGRES_USER" = "authentik";
        "POSTGRES_PASSWORD" = "changeme";
        "POSTGRES_DB" = "authentik";
        "TZ" = "Pacific/Auckland";
      };

      networks = [
        "proxy"
      ];

      volumes = [
        "/mnt/mac/Users/ben/VM-Data/authentik/postgres:/var/lib/postgresql/data"
      ];
    };

    "authentik-redis" = {
      image = "docker.io/library/redis:alpine";
      hostname = "authentik-redis";

      environment = {
        "TZ" = "Pacific/Auckland";
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
