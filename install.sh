# !/bin/sh
# install.sh

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update && sudo apt-get install -y zsh git tree terminator

zsh --version
git --version

# make ZSH the default shell environment
chsh -s $(which zsh)

echo $SHELL

# http://serverfault.com/questions/595314/how-to-set-the-default-shell-when-chsh-is-not-present
