# run ansible with tags
ansible_tags () {
  (cd {{ playbook_dir }} && ansible-playbook --ask-become-pass -v playbook.yml --tags="$1")
}

# returns your IP address
alias myip='curl ipv4.icanhazip.com && sleep 3 && exit'
