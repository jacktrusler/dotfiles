# Path to your oh-my-zsh installation.
export ZSH="/Users/tenzin/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ~/.oh-my-zsh/themes
ZSH_THEME="jacksCustom"

source $ZSH/oh-my-zsh.sh

#------------------------------------
# Aliases
#------------------------------------

alias vim='nvim'
alias tks='tmux kill-server'

#------------------------------------
# Path and Environment Variables
#------------------------------------

export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"
export PATH=/usr/local/share/python:$PATH
export PATH=$PATH:/Users/tenzin/Library/Python/3.8/bin
export PATH=$PATH:/Users/tenzin/Library/Python/3.9/bin
export PATH="$PATH:/Users/tenzin/.foundry/bin"
export PATH="$PATH:/Users/tenzin/.foundry/bin"
export PATH="$PATH:/Users/tenzin/go"
export PATH="$PATH:/Users/tenzin/go/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=${PATH}:$GOBIN:$GOROOT/bin
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:/Users/tenzin/scripts"
export OPENAI_API_KEY="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"
eval "$(rbenv init - zsh)"

#------------------------------------
# Keybinds
#------------------------------------

bindkey -s "^F" "tmux-sessionizer^M"
bindkey "^K" up-line-or-beginning-search
bindkey "^J" down-line-or-beginning-search
bindkey "^H" backward-char
bindkey "^L" forward-char

#------------------------------------
# Commands on Startup
#------------------------------------
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# set -o vi

#------------------------------------
# Miscellaneous 
#------------------------------------
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
