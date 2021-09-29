#!/usr/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# XDG

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor

export EDITOR="nvim"
export VISUAL="nvim"

# zsh

# O ZDOTDIR é o diretório onde ficarão os arquivos de configuração do Zsh.
# Aqui, este diretório será o ~/.config/zsh
# então os arquivos (no caso deste repositório, o .zshrc) deverão ficar nesse
# diretório.
# Os demais arquivos utilizados, como o do prompt e dos plugins, podem ficar em
# qualquer lugar, mas é bom manter todos juntos no ZDOTDIR.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
