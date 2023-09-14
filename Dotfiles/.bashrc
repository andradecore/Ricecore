# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
PS1='\W  '

# Disable Mouse Scroll
xinput set-button-map 8 1 2 3 0 0

# Bash commands
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=auto'
alias rm='sudo rm -r'

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

# XBPS
alias xr='sudo xbps-remove'
alias xrr='sudo xbps-remove -R'
alias xro='sudo xbps-remove -o'
alias xl='sudo xbps-install'
alias xq='xbps-query -Rs'
alias xu='xl -Su'
alias xusrc='cd /home/andrade/Others/void-packages && git pull && ./xbps-src update-sys'

# Folders
alias scripts='ranger ~/Others/Scripts'
alias steamapps='ranger .local/share/Steam/steamapps'

# Aplicativos
alias vim='nvim'
alias read='devour mupdf'
alias ani='ani-cli'
alias vis='cli-visualizer'
alias updatedb='sudo updatedb'
alias neofetch='neofetch --source ~/Others/copland.txt'

#neofetch --source ~/Others/copland.txt

# XDEB
export XDEB_OPT_DEPS=true
export XDEB_OPT_SYNC=true
export XDEB_OPT_WARN_CONFLICT=true
export XDEB_OPT_FIX_CONFLICT=true

##################################
############ PIPEWIRE ############
##################################
export PIPEWIRE_LATENCY=128/48000
