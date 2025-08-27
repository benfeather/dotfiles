# Ben's Dotfiles

## Install

### 1. Clone this repo: 

`git clone https://github.com/benfeather/dotfiles.git ~/Dotfiles`

### 2. Install Xcode (Mac Only): 

`xcode-select --install`

### 3. Download Nix:

Docs: https://nixos.org/download/

**Mac:** 

`$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)`

**Linux:** 

`$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`

### 4. Initial Setup:

**Mac:**

`sudo nix run nix-darwin --extra-experimental-features "flakes nix-command" -- switch --flake ~/Dotfiles/nix#hostname`

**Linux:**

`nixos-rebuild switch --flake ~/Dotfiles/nix#hostname`