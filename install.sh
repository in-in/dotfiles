#!/bin/bash
# install.sh

apps=(
  git
  # htop
  # shellcheck
  # tree
  build-essential
  libssl-dev
  zsh
  fonts-hack-ttf
)

DOTFILES_DIRECTORY="${HOME}/dotfiles"

sudo add-apt-repository -y ppa:git-core/ppa &&
sudo apt update &&
sudo apt install -y "${apps[@]}"

git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"

# oh-my-zsh installation
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
chsh -s /bin/zsh

# nvm installation
bash $DOTFILES_DIRECTORY/nvm/nvm.sh

# Create the necessary symbolic links between the `dotfiles` and `HOME`
ln -sv "$DOTFILES_DIRECTORY/shell/.zshrc" $HOME
ln -sv "$DOTFILES_DIRECTORY/shell/.aliases" $HOME

# bash $DOTFILES_DIRECTORY/terminal/terminal.sh

echo '***'
echo '****'
echo '*****'
command -v nvm &&
nmv -v
# nvm install --lts
# nvm alias default node
# nvm use --lts
echo '*****'
echo '****'
echo '***'

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

# tools
# https://github.com/anishathalye/dotbot/
