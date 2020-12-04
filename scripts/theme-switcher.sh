#!/bin/bash


if [ "$(whoami)" = "root" ]; then
	echo "Don't run this script as root!
	Aborting..."
	exit 1
fi


if [ ! -f "/home/$USER/.config/alacritty/alacritty.yml" ]; then
	echo "~/.config/alacritty/alacritty.yml not found
	Aborting..."
	exit 1
fi

if [ ! -f "/home/$USER/.config/powerline-shell/config.json" ]; then
	echo "~/.config/powerline-shell/config.json not found
	Aborting.."
	exit 1
fi

if [ ! -f "/home/$USER/.vimrc" ]
then
	echo "~/.vimrc not found
	Aborting..."
	exit 1
fi


function help() {
	echo "Usage: ./theme-switcher.sh [color]
	-h/--help - show this menu
	blue/purple/green - chg system theme color"
	exit 0
}


function chg_theme {
	if [ $1 = "blue" ]; then
		# Edit bg color value in alacritty cfg 
		sed -i "s/background\: '\#[a-fA-F0-9]*'/background\: '\#292c3e'/" ~/.config/alacritty/alacritty.yml	
		# Change powerline-shell theme
		sed -i "s/\/[a-z-]*\.py/\/$1\.py/" /home/snekyy/.config/powerline-shell/config.json	
		# Change vim theme
		sed -i "s/colorscheme .*/colorscheme archery/" ~/.vimrc
	elif [ $1 = "purple" ]; then
		sed -i "s/background\: '\#[a-fA-F0-9]*'/background\: '\#292c3e'/" ~/.config/alacritty/alacritty.yml	
		sed -i "s/\/[a-z-]*\.py/\/$1\.py/" /home/snekyy/.config/powerline-shell/config.json
		sed -i "s/colorscheme .*/colorscheme dogrun/" ~/.vimrc
	# green
	else
		sed -i "s/background\: '\#[a-fA-F0-9]*'/background\: '\#262626'/" ~/.config/alacritty/alacritty.yml
		sed -i "s/\/[a-z-]*\.py/\/$1\.py/" /home/snekyy/.config/powerline-shell/config.json	
		sed -i "s/colorscheme .*/colorscheme gruvbox/" ~/.vimrc
	fi
	
	echo "System theme changed successfully!"
	exit 0
}


if [ $# -eq 0 ] || [ $# -eq 1 -a $1 = "-h" -o $1 = "--help" ]
then
	help	
elif [ $# -eq 1 ]; then
	if [ $1 = "blue" -o $1 = "purple" -o $1 = "green" ]; then
		chg_theme $1
	else
		echo "unknown argument - $1
		Aborting..."
		exit 1
	fi
else
	echo "too many arguments $# (max 1)
	Aborting..."
	exit 1
fi
