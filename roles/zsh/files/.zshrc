#!/bin/bash

# path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# default editor
export EDITOR="/usr/bin/code --wait"

# media storage
export STORAGE="/media/$USER/storage"

# improve output of less
export LESS="--tabs=2 --status-column --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --LINE-NUMBERS --HILITE-UNREAD"

# default theme for shell
ZSH_THEME="miloshadzic"

# uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# which plugins would you like to load?
plugins=(git npm pip zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.aliases.sh"
source "$HOME/.nvm/nvm.sh"
