#!/bin/bash

# path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# default editor
export EDITOR="/usr/bin/code --wait"

# media storage
export STORAGE="/media/$USER/storage"

# improve output of less
export LESS="--tabs=2 --status-column --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --LINE-NUMBERS --HILITE-UNREAD"

# authorize SSH via _gpg-agent_ rather than _ssh-agent_
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# default theme for shell
ZSH_THEME="miloshadzic"

# uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# activate the highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# which plugins would you like to load?
plugins=(git npm pip zsh-autosuggestions)

# the `source` command must be at the end of `.zshrc`
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.aliases.sh"
source "$HOME/.nvm/nvm.sh"
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
