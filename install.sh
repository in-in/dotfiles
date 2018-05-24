#!/bin/bash

read -s -p "SUDO Password: " pass
echo
read -s -p "VAULT Password: " vault_pass

echo "$vault_pass" > /tmp/.vault_pass

echo "$pass" | sudo -S apt remove -y update-manager &&
sudo apt-add-repository -y ppa:ansible/ansible &&
sudo apt update &&
sudo apt install -y python-apt python-jmespath ansible git &&

DOTFILES_DIRECTORY=$HOME/dotfiles

git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"
cd $DOTFILES_DIRECTORY

ansible-playbook --extra-vars "ansible_become_pass=$pass" --vault-password-file="/tmp/.vault_pass" --verbose playbook.yml

# ansible-playbook --ask-become-pass --ask-vault-pass --verbose playbook.yml
# ansible-galaxy init zsh --offline
# ansible-vault encrypt_string 'foobar'
