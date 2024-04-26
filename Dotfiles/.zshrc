if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec startx &>/dev/null 
fi

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Import the colors.
. "${HOME}/.cache/wal/colors.sh"

# NNN
export NNN_PLUG='p:preview-tui'
export NNN_FIFO="/tmp/nnn.fifo"
#export NNN_FCOLORS="AAAAE631BBBBCCCCDDDD9999"
export NNN_USE_EDITOR=1
export NNN_TERMINAL="st"
export PAGER="less -R"
source $HOME/.local/zsh/quitcd.zsh

# Create the alias.
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

##################################
############# PROMPT #############
##################################
#6c7086
PROMPT='%F{8}$%f '
PROMPT='%F{#66BEFF}%1~%f %F{White}%f  '

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search.zsh

##################################
############# BÁSICO #############
##################################

xset r rate 200 50
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

PATH=$PATH:$HOME/Others/Scripts

##################################
############# ALIAS ##############
##################################

# Zsh commands
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=auto'
alias rm='sudo rm -r'
alias cp='cp -r'
alias wmclass='xprop | grep WM_CLASS'
alias vim='nvim'
alias tar='tar -xvf'

# XBPS
alias xr='sudo xbps-remove'
alias xrr='sudo xbps-remove -R'
alias xro='sudo xbps-remove -o'
alias xl='sudo xbps-install -S'
alias xs='xbps-query -Rs'
alias xq='xbps-query'
alias xu='sudo xbps-install -Su'

# XBPS-SRC
alias xi='sudo xbps-install --repository hostdir/binpkgs/nonfree'
alias xusrc='cd ~/Others/void-packages && git pull && ./xbps-src update-sys'

# GIT
alias gs='git status'
alias ga='git add .'
alias gm='git commit -m'
alias gp='git push -f -u origin main'

# Apps
alias updatedb='sudo updatedb'
alias tsm='transmission-remote'
alias zathura='devour zathura'
alias ani=cli='deovur ani-cli'
#ufetch

# Reload theme
alias reload='cd ~/.config/dwm && rm config.h && sudo make install && cd ~/.config/dwm/dmenu && rm config.h && sudo make install && cd ~/.config/dwm/st && rm config.h && sudo make install'

##################################
############# COLORS #############
##################################

#LS_COLORS='rs=0:di=1;97:fi=1;90';
LS_COLORS='rs=0:di=1;34:fi=1;30:ln=1;34'
export LS_COLORS

##################################
############ PIPEWIRE ############
##################################
export PIPEWIRE_LATENCY=128/48000

export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
