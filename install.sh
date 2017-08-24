#!/bin/bash
# install.sh
# bash ./install.sh

apps=(
  zsh
  git
  tree
  terminator
)

DOTFILES_DIRECTORY="${HOME}/dotfiles"

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y "${apps[@]}"


# make ZSH the default shell environment
chsh -s "$(which zsh)"

git clone https://dmin@bitbucket.org/dmin/dotfiles.git
# cd dotfiles

ln -sv "$DOTFILES_DIRECTORY/dotfiles/shell/.zshrc" $HOME

shutdown -r now

# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://driesvints.com/blog/getting-started-with-dotfiles/
# http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/


# https://raw.githubusercontent.com/necolas/dotfiles/master/bin/dotfiles
