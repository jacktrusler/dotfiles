plugins=(virtualenv autojump)
function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Path to your oh-my-zsh installation.
export ZSH="/home/jack/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ~/.oh-my-zsh/themes
ZSH_THEME="af-magic"

source $ZSH/oh-my-zsh.sh

#------------------------------------
# Aliases
#------------------------------------

alias vim="nvim"
alias open="xdg-open"
alias task="go-task"
alias gasx3='git push -f'
alias g='git'
alias tks='tmux kill-session'
alias tkS='tmux kill-server'
alias ip='ip -c'

#------------------------------------
# Keybinds
#------------------------------------

bindkey -s "^F" "tmux-sessionizer"
bindkey -v "K" up-line-or-beginning-search
bindkey -v "J" down-line-or-beginning-search

#------------------------------------
# PATH and environment variables
#------------------------------------

export PATH="$PATH:/home/jack/scripts"

#------------------------------------
# Other ZSH settings
#------------------------------------

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
set -o vi
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# Save the location of the current completion dump file.
# if [ -z "$ZSH_COMPDUMP" ]; then
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
# fi
