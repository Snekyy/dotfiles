#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# Aliases
#

# Colorize
alias ls='exa --color=always --group-directories-first'
alias la='exa -aFG --color=always --group-directories-first'
alias ll='exa -lgFG --color=always --group-directories-first'
alias lla='exa -lagFG --color=always --group-directories-first'
alias lt='exa -T --color=always --group-directories-first'
alias cat='highlight --out-format=ansi'
alias grep='grep --color=always'
alias pacman='sudo pacman --color=always'
alias p='sudo pacman --color=always'
alias yay='yay --color=always'

# Confirm before overwriting something
alias rm='rm -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Pacman
# remove orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# exec shell
alias reload='exec $SHELL'


#
# Prompt
#

if [ $(which powerline-shell --help &> /dev/null; echo $?) -gt 0 ] ; then
    # Default
    PS1=" \w \[\033[01;31m\]>\[\033[01;32m\]>\[\033[01;34m\]>\[\033[00m\] "
else
    # Powerline-shell
    function _update_ps1() {
        PS1=$(powerline-shell $?)
    }

    if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
fi


#
# Commands
#

### ARCHIVE EXTRACTION
# usage: ex <archive>
ex () {
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
