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
export NNN_LOCKER=snowmachine

# History control
#

export HISTCONTROL=ignoreboth	
export HISTIGNORE='ls:ps:history*'
export HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S:'
export HISTSIZE=9999999999999999999999999

