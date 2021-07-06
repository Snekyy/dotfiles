#!/bin/bash
#
# Dotfiles installation bash script for Arch based dirstos.
# Downloads and installs deps for dotfiles and
# copies dotfiles to user's home directory.
#
# ! Requires yay to install deps !
#

# Colors
red="\033[01;31m"
green="\033[01;32m"
reset="\033[00m"

#
# SYSTEM CHECK
#

# Check os
distros="Arch\|Artix\|Arco\|EndeavourOS\|Manjaro"
if ! grep "$distros" /etc/*-release > /dev/null 2>&1; then
	echo -e "-> $red[Error]$reset: Your OS is not Arch based.\nAborting.." && exit 1
fi

# TODO: git availability check, yay "no" choice completion
# Check yay availability
if ! which yay > /dev/null 2>&1; then
	echo -e "-> $red[Error]$reset: yay is required to install dependencies!"
	read -r -p "-> Would you like to install yay? [Y/n]: " user_choice
	case $user_choice in
		[yY]|""|"Yes"|"yes")
			git clone https://aur.archlinux.org/yay.git $HOME/.script_setup
			cd $HOME/.script_setup && makepkg -sri && cd .. && rm -rf .script_setup
			echo -e "$green[*]$reset Yay is installed"
		;;
		[nN])
			echo "Aborting.." && exit 0
		;;
		[*])
			echo "Aborting.." && exit 1
		;;
	esac
else
	echo -e "$green[*]$reset Yay is detected"
fi

#
# VARIABLES
#

# Repository dir
repo_dir=$(echo $0 | sed "s/\/setup\.sh$//")
# New/old dotfiles folder
dots="$HOME/dotfiles"
old_dots="$HOME/old_dotfiles"

#
# DEPENDENCIES INSTALLATION
#

# Delete all comments, empty lines
# add spaces between packages.
dependencies=$(sed "/^#\|^$/d" $repo_dir/dependencies.txt | tr "\n" " ")
# Update system
echo "-> Updating operation system.."
sudo pacman -Suy --noconfirm --disable-download-timeout
echo -e "$green[*]$reset System updated"
# Install deps
echo "-> Downloading/installing dependencies.."
yay -S $dependencies --answerclean All --answerdiff None --noconfirm --disable-download-timeout
echo -e "$green[*]$reset Dependencies are installed"

#
# INSTALLING DOTFILES
#

echo "-> Installing dotfiles.."
mkdir $dots
mkdir $old_dots
[ -f "$HOME/.config" ] || mkdir $HOME/.config
echo "--> Copying new dotfiles to $dots.."
cp -r $repo_dir/cfg/* $dots
cd $dots
# Prepare files list(without dots)
files=$(/bin/ls --color=never -1; /bin/ls config --color=never | sed "s/^/config\//" | sed "/config$/d")
for file in $files
do
	echo ".$file.."
	if [ -f "$HOME/.$file" ]; then
		mv "$HOME/.$file" $old_dots
	fi
	ln -s $dots/$file $HOME/.$file
done
echo "--> Old dotfiles stored into $old_dots"
echo -e "$green[x]$reset Dotfiles installed successfully"
