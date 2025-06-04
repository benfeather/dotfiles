# Ben's Dotfiles

1. Install Xcode
`xcode-select --install`

2. Clone this repo
`git clone https://github.com/benfeather/dotfiles.git ~/Dotfiles`

3. Install Nix Darwin CLI
`sh <(curl -L https://nixos.org/nix/install)`

4. Install
`nix run nix-darwin --extra-experimental-features "flakes nix-command" -- switch --flake ~/Dotfiles/nix`