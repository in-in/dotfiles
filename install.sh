#!/bin/bash

read -s -p "SUDO Password: " pass
echo

echo "$pass" | sudo -S apt remove -y update-manager &&
sudo apt-add-repository -y ppa:ansible/ansible &&
sudo apt update &&
sudo apt install -y python-apt python-jmespath ansible git &&

DOTFILES_DIRECTORY=$HOME/dotfiles

git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"
cd $DOTFILES_DIRECTORY
echo

ansible-playbook --ask-vault-pass --verbose --extra-vars "ansible_become_pass=$pass" playbook.yml

# ansible-galaxy init zsh --offline
# ansible-vault encrypt_string 'foobar'
