#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
# Exports
#

export PATH=$PATH:$HOME/.local/bin
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PAGER="less"

#
# History tuning
#

export HISTTIMEFORMAT='%h %d %H:%M:%S '
# the maximum number of lines contained in the history file
export HISTSIZE=10000
# don’t save lines which begin with a <space> character and
# don’t save lines matching the previous history entry
export HISTCONTROL=ignoreboth	
export HISTIGNORE='ls:la:ll:lla:lt:ps:history*'

