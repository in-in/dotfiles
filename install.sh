#!/bin/bash

sudo apt-get remove -y update-manager &&
sudo apt-add-repository -y ppa:ansible/ansible &&
sudo apt-get update &&
sudo apt-get install -y python-apt python-jmespath ansible git &&

DOTFILES_DIRECTORY=$HOME/dots

git clone https://dmin@bitbucket.org/dmin/dots.git "$DOTFILES_DIRECTORY"

cd $DOTFILES_DIRECTORY

ansible-playbook --ask-become-pass --verbose playbook.yml

#https://github.com/sloria/dotfiles
#https://github.com/wincent/wincent
#https://github.com/ansible/ansible/blob/devel/examples/ansible.cfg


# ansible localhost -m setup
# ansible localhost -m command -a "uptime"
# ansible-playbook --syntax-check playbook.yml
# ansible-playbook --check playbook.yml
# ansible-playbook -Kv --check playbook.yml
# ansible-playbook playbook.yml --list-hosts
# ansible-doc -l | grep apt
# ansible-playbook --ask-become-pass playbook.yml
# ansible-galaxy init zsh
