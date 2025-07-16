# Ben's Dotfiles

1. Clone this repo: `git clone https://github.com/benfeather/dotfiles.git ~/Dotfiles`

2. (Mac Only) Install Xcode: `xcode-select --install`

3. Install Nix
Docs: https://nixos.org/download/
Linux: `$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`
Mac: `$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)`

4. Initial Setup
Mac: `nix run nix-darwin --extra-experimental-features "flakes nix-command" -- switch --flake ~/Dotfiles/nix`
Linux: ``