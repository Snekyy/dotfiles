#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fuckcmd
eval "$(thefuck --alias)"

#
# Aliases
#

# Colorize
alias ls='exa --color=always --group-directories-first'
alias la='exa -aFG --color=always --group-directories-first'
alias ll='exa -lgFG --color=always --group-directories-first'
alias lla='exa -lagFG --color=always --group-directories-first'
alias lt='exa -T --color=always --group-directories-first'
alias ccat='highlight --out-format=ansi'
alias grep='grep --color=always'
alias pacman='pacman --color=always'

# Confirm before overwriting something
alias rm='rm -i'
alias mv='mv -i'

# Navigation
alias n="nnn -dCeHoQ -t 20"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Pacman
# remove orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# exec shell
alias reload='exec $SHELL'

# please 
alias please="sudo"

#
# PS1
#

# powerline-shell PS1
function _update_ps1() {
	    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#
# Commands
#

### ARCHIVE EXTRACTION
# usage: ex <archive>
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

