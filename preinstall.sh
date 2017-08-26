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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
