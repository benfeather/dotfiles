let
  hello-world = pkgs.writeShellApplication {
    name = "my-complex-script";
    text = ''
      echo "hello world"
    '';
  };
in
{
  home.packages = [ hello-world ];
}
