# modules/lib/mkHost.nix
{
  darwin,
  home,
  nixpkgs,
  inputs,
  self,
}:

mkHost:
let
  builder = if host.os == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;

  homeDirectory = if host.os == "darwin" then "/Users/${host.user}" else "/home/${host.user}";

  homeManager =
    if host.os == "darwin" then home.darwinModules.home-manager else home.nixosModules.home-manager;
in
{
  name = host.name;
  value = builder {
    system = "${host.arch}-${host.os}";
    modules = [
      homeManager
      (self + "/modules/shared/default.nix")
      (self + "/modules/shared/${host.os}.nix")
      (self + "/hosts/${host.os}/${host.name}/configuration.nix")
    ];
    specialArgs = {
      inherit homeDirectory host inputs;
    };
  };
}
