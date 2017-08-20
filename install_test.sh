#!/bin/bash
#install.sh
#bash ./install.sh

apps=(
  zsh
  git
  tree
  terminator
)

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y "${apps[@]}"


# make ZSH the default shell environment
chsh -s "$(which zsh)"

shutdown -r now

# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://driesvints.com/blog/getting-started-with-dotfiles/
