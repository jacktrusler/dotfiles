plugins=(virtualenv)
function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Path to your oh-my-zsh installation.
export ZSH="/home/jack/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ~/.oh-my-zsh/themes
ZSH_THEME="jacksCustom"

source $ZSH/oh-my-zsh.sh

#------------------------------------
# Aliases
#------------------------------------

alias vim="nvim"
alias open="xdg-open"
alias task="go-task"
alias gasx3='git push -f'
alias lg='lazygit'
alias ks='tmux kill-server' 
alias g='git'
alias tks='tmux kill-server'
alias ip='ip -c'

#------------------------------------
# Keybinds
#------------------------------------

bindkey -s "^F" "tmux-sessionizer^M"
bindkey "^K" up-line-or-beginning-search
bindkey "^J" down-line-or-beginning-search
bindkey "^H" backward-char
bindkey "^L" forward-char

#------------------------------------
# PATH and environment variables
#------------------------------------

export PATH="$PATH:/home/jack/scripts"
export PATH="$PATH:/opt/intellij_idea/bin"
export GOPATH="$HOME/go"
export LUA_PATH="/usr/share/lua/5.4/luarocks/?.lua;;"
export OPENAI_API_KEY="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"
export JAVA_HOME="/usr/lib/jvm/java-19-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

#------------------------------------
# Other ZSH settings
#------------------------------------

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# set -o vi
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# Save the location of the current completion dump file.
# if [ -z "$ZSH_COMPDUMP" ]; then
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
# fi
