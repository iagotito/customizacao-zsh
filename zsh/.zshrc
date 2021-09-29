#!/usr/bin/zsh

# prompt configuration
# o arquivo de configuração do prompt estão em $ZDOTDIR/prompt/prompt_setup
# Aqui o diretório é adicionado ao fpath e é feio um autoload do arquivo
# (pense nisso tudo como um import)
fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz prompt_setup; prompt_setup

# aliases
source $HOME/aliases


# Plugins
# os plugins estão no diretório $ZDOTDIR/plugins, então para fazer source
# deles, é necessário usar esse path.

# zsh completion
source $ZDOTDIR/plugins/completion.zsh

# activate the syntax highlighting
# see: https://github.com/zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Options
# configurações de outras opções do zsh

# zhistory

setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# zsh directory stack

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias ds='dirs -v'  # directy stack
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim mapping for completion

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
