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

# Create the alias.
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

##################################
############# NVIDIA #############
##################################
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE_SIZE=100000000000

##################################
############ CLIPMENU ############
##################################
export CM_SELECTIONS="clipboard"
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10
CM_LAUNCHER=dmenu

##################################
############# PROMPT #############
##################################
#6c7086
PROMPT='%F{8}$%f '
PROMPT='%F{#66BEFF}%1~%f %F{White}%f  '

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

##################################
############# BÁSICO #############
##################################

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

xset r rate 200 50
PATH=$PATH:$HOME/Others/Scripts

##################################
############# ALIAS ##############
##################################

# Zsh commands
alias vim='nvim'
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=auto'
alias rm='sudo rm -r'
alias cp='cp -r'
alias wmclass='xprop | grep WM_CLASS'

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

# PACMAN
alias pr='sudo pacman -R'
alias prr='sudo pacman -Rns'
alias pro='sudo pacman -Rsn $(pacman -Qdtq)'
alias prc='sudo pacman -Sc'
alias pl='sudo pacman -S'
alias ps='pacman -Ss'
alias pq='pacman -Qeq'
alias pu='sudo pacman -Syu'
alias pacache='sudo du -sh /var/cache/pacman/pkg .cache/yay'

# YAY
alias yr='yay -R'
alias yrr='yay -Rns'
alias yl='yay -S'
alias ys='yay -Ss'
alias yq='yay -Qeq'
alias yu='yay -Syu'

# GIT
alias gs='git status'
alias ga='git add .'
alias gm='git commit -m'
alias gp='git push -f -u origin main'

# Aplicativos
alias updatedb='sudo updatedb'
alias neofetch='neofetch --source ~/Others/seahorse.txt'
#neofetch --source ~/Others/seahorse.txt
#ufetch

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
