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
      "${self}/system/base.nix"
      "${self}/system/${host.os}.nix"
      "${self}/hosts/${host.name}/configuration.nix"
    ];
    specialArgs = {
      inherit homeDirectory host inputs;
    };
  };
}
