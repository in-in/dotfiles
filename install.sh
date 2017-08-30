#!/bin/sh
# install.sh
# sh ./preinstall.sh

# apps=(
#   zsh
#   git
#   # tree
#   # terminator
# )

# DOTFILES_DIRECTORY="${HOME}/dotfiles"

sudo add-apt-repository -y ppa:git-core/ppa &&
sudo apt-get update &&
# sudo apt-get install -y "${apps[@]}"
sudo apt-get install -y zsh git

echo '***'
echo 'START1'
echo '***'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&

echo '***'
echo 'END2'
echo '***'

# printf "Looking for an existing zsh config...\n"
#   if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
#     printf "Found ~/.zshrc. Backing up to ~/.zshrc.old\n";
#     mv ~/.zshrc ~/.zshrc.old;
#   fi
# 
# git clone https://github.com/in-in/dotfiles.git
# 
# ln -sv "$DOTFILES_DIRECTORY/shell/.zshrc" $HOME

# shutdown -r now

# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://driesvints.com/blog/getting-started-with-dotfiles/
# http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/


# https://raw.githubusercontent.com/necolas/dotfiles/master/bin/dotfiles
