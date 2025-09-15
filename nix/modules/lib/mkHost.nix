{
  inputs,
  self,
}:

host:

let
  builder =
    if host.os == "darwin" then inputs.darwin.lib.darwinSystem else inputs.nixpkgs.lib.nixosSystem;

  homeDirectory = if host.os == "darwin" then "/Users/${host.user}" else "/home/${host.user}";

  homeModule =
    if host.os == "darwin" then
      inputs.home.darwinModules.home-manager
    else
      inputs.home.nixosModules.home-manager;
in
{
  name = host.name;
  value = builder {
    system = "${host.arch}-${host.os}";
    modules = [
      homeModule
      "${self}/modules/shared/default.nix"
      "${self}/modules/shared/${host.os}.nix"
      "${self}/hosts/${host.os}/${host.name}/configuration.nix"
    ];
    specialArgs = {
      inherit homeDirectory host inputs;
    };
  };
}
