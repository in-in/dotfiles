# authorize SSH via gpg-agent rather than ssh-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
