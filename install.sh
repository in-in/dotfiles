#!/bin/bash

common_action(){
  echo "$pass" | sudo -S apt remove -y update-manager &&
  sudo apt update &&
  sudo apt install -y python3-pip git &&

  sudo -H python3 -m pip install --upgrade\
    pip\
    setuptools\
    launchpadlib\
    virtualenv\
    jmespath\
    python-apt\
    ansible &&
  # launchpadlib - requires testresources (jmespath etc)
  # virtualenv - ansible pip module requirements

  DOTFILES_DIRECTORY=$HOME/dotfiles

  git clone https://github.com/in-in/dotfiles.git "$DOTFILES_DIRECTORY"
  cd $DOTFILES_DIRECTORY
}

read -s -p "SUDO Password: " pass
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
