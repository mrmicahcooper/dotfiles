#/usr/bin/env nu

#MISE description="install packages"

sudo pacman -Syu
sudo pacman -S ...[
  ghostty
  git
  mise
  neovim
  nushell
  podman
  postgresql
  ripgrep
  starship
  yay
]

yay -S ...[
  1password
  1password-cli
]
