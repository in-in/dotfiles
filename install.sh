#!/bin/bash
# install.sh

APPS=(
  build-essential
  chromium-browser
  emacs25
  fonts-hack-ttf
  git
  glances
  libssl-dev
  libvips-tools
  mpv
  shellcheck
  shutter
  tree
  zsh
)

REPOS=(
  ppa:git-core/ppa
  ppa:kelleyk/emacs
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
ln -s $DOTFILES_DIRECTORY/shell/.zshrc $HOME
ln -s $DOTFILES_DIRECTORY/shell/.aliases $HOME
ln -s $DOTFILES_DIRECTORY/mpv $HOME/.config/mpv
ln -s $DOTFILES_DIRECTORY/emacs.d $HOME/.emacs.d
ln -s $DOTFILES_DIRECTORY/bin $HOME/bin


# oh-my-zsh plugins
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions


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

# Example

# https://github.com/anishathalye/dotfiles
# https://github.com/driesvints/dotfiles
# https://github.com/holman/dotfiles
# https://github.com/mathiasbynens/dotfiles
# https://github.com/michaeljsmalley/dotfiles
# https://github.com/necolas/dotfiles
# https://github.com/rtomayko/dotfiles
# https://github.com/ryanb/dotfiles
# https://github.com/skwp/dotfiles
# https://github.com/sobolevn/dotfiles
# https://github.com/thoughtbot/dotfiles
