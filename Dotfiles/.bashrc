# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# NNN
export NNN_PLUG='p:preview-tui'
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_FCOLORS="AAAAE631BBBBCCCCDDDD9999"
export NNN_USE_EDITOR=1
export NNN_TERMINAL="st"
export PAGER="less -R"
source $HOME/.local/zsh/quitcd.zsh
