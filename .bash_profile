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
export TERMINAL="alacritty"
export BROWSER="firefox"

#
# History control
#

HISTCONTROL=ignoreboth	
HISTIGNORE='ls:ps:history*'
HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S:'
HISTSIZE=9999999999999999999999999

