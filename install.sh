#!/bin/bash
# install.sh

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

git clone https://dmin@bitbucket.org/dmin/dotfiles.git
cd dotfiles

ln -sv "$HOME/dotfiles/.zshrc" $HOME

# shutdown -r now
