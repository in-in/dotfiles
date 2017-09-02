#!/bin/bash
# install.sh

apps=(
  zsh
  git
  # tree
  # terminator
)

DOTFILES_DIRECTORY="${HOME}/dotfiles"

sudo add-apt-repository -y ppa:git-core/ppa &&
sudo apt-get update &&
sudo apt-get install -y "${apps[@]}"

git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"

echo '***'
echo 'START'
echo '***'

# oh-my-zsh installation
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
chsh -s /bin/zsh

echo '***'
echo 'END'
echo '***'

ln -sv "$DOTFILES_DIRECTORY/shell/.zshrc" $HOME
ln -sv "$DOTFILES_DIRECTORY/shell/.aliases" $HOME

# shutdown -r now

# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://driesvints.com/blog/getting-started-with-dotfiles/
# http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/


# https://raw.githubusercontent.com/necolas/dotfiles/master/bin/dotfiles
