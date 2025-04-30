{
  inputs,
  ...
}:
{
  programs = {
    bash.enable = false;

    fish.enable = false;

    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}