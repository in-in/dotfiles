#!/bin/bash

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/.local/bin:$PATH

# shellcheck disable=SC2034
ZSH_THEME="miloshadzic"

# shellcheck disable=SC2034
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# shellcheck disable=SC2034
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# shellcheck disable=SC2034
# Which plugins would you like to load?
plugins=(git npm zsh-autosuggestions)

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
source $HOME/.nvm/nvm.sh
