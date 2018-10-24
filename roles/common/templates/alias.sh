# run ansible with tags
ansible_tags () {
  (cd {{ playbook_dir }} && ansible-playbook --ask-become-pass -v playbook.yml --tags="$1")
}
