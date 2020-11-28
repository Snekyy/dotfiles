#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# Exports
#

export PATH=$PATH:$HOME/.local/bin
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim

# History control
export HISTCONTROL=ignoreboth	
export HISTIGNORE='ls:ps:history*'
#PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT='%d.%m.%Y %H:%M:%S: '


#
# Aliases
#

# Replace ls with exa
alias ls='exa --color=always --group-directories-first'
alias la='exa -aFG --color=always --group-directories-first'
alias ll='exa -lgFG --color=always --group-directories-first'
alias lla='exa -lagFG --color=always --group-directories-first'
alias lt='exa -T --color=always --group-directories-first'

# Colorize grep output
alias grep='grep --color=auto'

# Confirm before overwriting something
alias rm='rm -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias n='nnn -d'

# Pacman
# remove orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'



# Default bash PS1
#PS1='\u > \W > \$ '

# Zsh like PS1
#PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"

# powerline-shell PS1
function _update_ps1() {
	    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

