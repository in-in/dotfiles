#!/bin/bash
# install.sh

APPS=(
  git
  # htop
  # shellcheck
  # tree
  build-essential
  libssl-dev
  zsh
  fonts-hack-ttf
  mpv
)

REPOS=(
  ppa:git-core/ppa
  ppa:mc3man/mpv-tests
)

for r in "${REPOS[@]}"
do
  sudo add-apt-repository -y $r
done

sudo apt update &&
sudo apt install -y "${APPS[@]}"

DOTFILES_DIRECTORY="${HOME}/dotfiles"

git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"


# oh-my-zsh installation
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
chsh -s /bin/zsh


# Create the necessary symbolic links between the `dotfiles` and `HOME`
ln -sv "$DOTFILES_DIRECTORY/shell/.zshrc" $HOME
ln -sv "$DOTFILES_DIRECTORY/shell/.aliases" $HOME
ln -sv "$DOTFILES_DIRECTORY/mpv/*.conf" $HOME/.config/


# nvm installation
bash $DOTFILES_DIRECTORY/nvm/nvm.sh
. $HOME/.nvm/nvm.sh

# node installation
nvm install --lts
nvm alias default node
nvm use --lts

# update npm
npm install -g npm

# terminal settings
bash $DOTFILES_DIRECTORY/terminal/terminal.sh

# shutdown -r now

# read
# https://driesvints.com/blog/getting-started-with-dotfiles/
# http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
# https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/

# Example
# https://raw.githubusercontent.com/necolas/dotfiles/master/bin/dotfiles
# https://github.com/anishathalye/dotfiles
# https://github.com/thoughtbot/dotfiles
# https://github.com/holman/dotfiles
# https://github.com/mathiasbynens/dotfiles
# https://github.com/skwp/dotfiles
