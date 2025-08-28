{
  config,
  ...
}:
let
  env = import ../utils/env.nix;
in
{
  virtualisation.oci-containers.containers = {
    "postgres" = {
      image = "docker.io/library/postgres:alpine";
      hostname = "postgres";

      environment = {
        "POSTGRES_USER" = config.sops.placeholder."global/pg_db_user";
        "POSTGRES_PASSWORD" = config.sops.placeholder."global/pg_db_pass";
        "TZ" = env.tz;
      };

      networks = [
        "proxy"
      ];

      volumes = [
        "/mnt/mac/Users/ben/VM-Data/postgres:/var/lib/postgresql/data"
      ];
    };
  };
}
