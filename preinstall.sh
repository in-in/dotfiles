#!/bin/bash
# preinstall.sh
# bash ./preinstall.sh

apps=(
  zsh
  git
  # tree
  # terminator
)

sudo add-apt-repository -y ppa:git-core/ppa &&
sudo apt-get update &&
sudo apt-get install -y "${apps[@]}"

git clone https://github.com/in-in/dotfiles.git &&
cd dotfiles &&

bash install.sh
