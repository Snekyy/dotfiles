#
# ~/.bash_profile
#

export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim
HISTSIZE=9999999999999999999999
HISTCONTROL=ignoreboth	
HISTIGNORE='ls:ps:history*'
HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S: '

[[ -f ~/.bashrc ]] && . ~/.bashrc

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# Start graphical server if bspwm if not already running
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x bspwm || exec startx
fi

