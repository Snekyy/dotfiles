#!/bin/bash
#
# Dotfiles installation bash script for Arch based distros.
# Downloads and installs deps for dotfiles and
# copies dotfiles themselves to user's home directory($HOME).
#
# Original dotfiles placed at $HOME/dotfiles.
# Dotfiles that already exist(users old dotfiles)
# and should be replaced with new will be
# moved to $HOME/old_dotfiles.
# Dotfiles that used by real programms are just symlinks of
# files from $HOME/dotfiles. This way is really useful for
# managing dotfiles in system.
#
# ! Script should be executed from repo dir to work correctly !!
#


# Colors for messages
red="\033[01;31m"
green="\033[01;32m"
reset="\033[00m"


systemCheck() {
	# Check os
	distros="Arch\|Artix\|Arco\|EndeavourOS\|Manjaro"
	if ! grep "$distros" /etc/*-release > /dev/null 2>&1; then
		echo -e "-> $red[Error]$reset: Your OS is not Arch based.\nAborting.." && exit 1
	fi

	# Check yay availability
	if ! which yay > /dev/null 2>&1; then
		echo -e "-> $red[Error]$reset: yay is required to install dependencies!"
		read -r -p "-> Would you like to install yay? [Y/n]: " user_choice
		case $user_choice in
			[yY]|""|"Yes"|"yes")
				git clone https://aur.archlinux.org/yay.git /tmp/script_setup/yay
				cd /tmp/script_setup/yay && makepkg -sri; cd .. && rm -rf yay
				echo -e "$green[*]$reset Yay is installed"
			;;
			*)
				echo "Yay is required to install dependencies.\nAborting.."
				exit 1
			;;
		esac
	else
		echo -e "$green[*]$reset Yay is detected"
	fi
}

installDeps() {
	# Delete all comments, empty lines add spaces between package names.
	dependencies=$(sed "/^#\|^$/d" $PWD/dependencies.txt | tr "\n" " ")

	echo "-> Downloading/installing dependencies.."
	yay -S $dependencies --answerclean All --answerdiff None --disable-download-timeout --needed
	if [ $? -eq 0 ]; then
		echo -e "$green[*]$reset Dependencies are installed"
	else
		echo -e "$red[*]$reset Dependencies are not installed!"
	fi
}

copyFiles() {
	echo "-> Installing dotfiles.."

	repo_dir=$PWD
	dots_dir="$HOME/dotfiles"
	dots_old_dir="$HOME/old_dotfiles"

	# Prepare home directory.

	# TODO: check if the another "dotfiles" is a repo
	#      if it is then give it appropriate name.
	# If "dotfiles" directory already exists
	# (it is may be repo) then copy dots from repo
	# to tmp dir, rename "dotfiles" directory,
	# and move tmp files to destination folder.
	if [ -d "$dots_dir" ]; then
		mkdir -p /tmp/script_setup/dotfiles_tmp
		cp -r $repo_dir/cfg/* /tmp/script_setup/dotfiles_tmp
		mv "$dots_dir" "$HOME/dotfiles_unknown"
		echo "--> ! Found 'dotfiles' in your home directory, its renamed to 'dotfiles_unknown' ,"
		echo "      It is may be a dotfiles repository directory !"
		mkdir $dots_dir
		mv /tmp/script_setup/dotfiles_tmp/* $dots_dir
		rmdir /tmp/script_setup/dotfiles_tmp
	# just copy dots
	else
		mkdir $dots_dir
		cp $repo_dir/cfg/* -r $dots_dir
	fi

	mkdir -p "$dots_old_dir/.config"
	[ -d "$HOME/.config" ] || mkdir "$HOME/.config"

	# Get list of dotfiles(without dots - ".")
	cd $dots_dir
	files=$(/bin/ls --color=never -1 | sed "/^config$/d"; /bin/ls config --color=never | sed "s/^/config\//")

	# Create symlinks
	for file in $files
	do
		echo "$file"
		# If old dotfile has the same name as new
		# move it to old_dotfiles directory
		if [ -e "$HOME/.$file" ]; then
			# If it is a dotfiles from ".config" folder
			if [ $(echo $file | grep "config" > /dev/null 2>&1; echo $?) -eq 0 ]; then
				mv "$HOME/.$file" "$dots_old_dir/.config/"
			else
				mv "$HOME/.$file" $dots_old_dir
			fi
		fi
		# Create a symlink of orig dotfiles
		ln -s $dots_dir/$file "$HOME/.$file"
	done

	echo "--> Old dotfiles stored into $dots_old_dir"
}


systemCheck
installDeps
copyFiles
