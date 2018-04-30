#!/bin/bash

sudo apt-get remove -y update-manager &&
sudo apt-add-repository -y ppa:ansible/ansible &&
sudo apt-get update &&
sudo apt-get install -y python-apt python-jmespath ansible git &&

DOTFILES_DIRECTORY=$HOME/dots

git clone https://dmin@bitbucket.org/dmin/dots.git "$DOTFILES_DIRECTORY"

cd $DOTFILES_DIRECTORY

ansible-playbook --ask-become-pass --verbose --vault-id @prompt playbook.yml

# ansible localhost -m command -a "uptime"
# ansible localhost -m setup
# ansible-doc -l | grep apt
# ansible-galaxy init zsh
# ansible-galaxy init zsh --offline
# ansible-playbook --ask-become-pass playbook.yml
# ansible-playbook --check playbook.yml
# ansible-playbook --syntax-check playbook.yml
# ansible-playbook -Kv --check playbook.yml
# ansible-playbook -Kv --vault-id @prompt playbook.yml
# ansible-playbook playbook.yml --list-hosts
# ansible-vault encrypt_string --vault-id @prompt 'foobar'
