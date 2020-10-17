#!/bin/bash

common_action(){
  echo "$pass" | sudo -S apt update &&
  sudo apt install -y\
  build-essential\
  git\
  python3-dev\
  python3-lxml\
  python3-pip &&

  sudo -H python3 -m pip install --upgrade\
    pip\
    launchpadlib\
    setuptools\
    virtualenv\
    python-apt\
    ansible &&

  DOTFILES_DIRECTORY=$HOME/dotfiles

  git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"
  cd "$DOTFILES_DIRECTORY" || exit
}

read -s -p "BECOME Password: " pass
echo
echo "Do you know the VAULT password?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
          read -s -p "VAULT Password: " vault_pass
          echo
          echo "$vault_pass" > /tmp/.vault_pass
          common_action;
          ansible-playbook --extra-vars "ansible_become_pass=$pass" --vault-password-file="/tmp/.vault_pass" --verbose playbook.yml
          break;;
        No )
          common_action;
          ansible-playbook --extra-vars "ansible_become_pass=$pass" --verbose playbook.yml
          exit;;
    esac
done
