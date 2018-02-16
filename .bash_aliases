##############
#Bash Aliases#
##############
# This file is my .bash_aliases file for ease of transport from multiple systems.

########################
#Navigation and Listing#
########################
alias ls='ls -CF'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias sl='ls'
alias lsl='ls -lhFA | less'
alias cd..='cd ..'
alias ..='cd ..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free='free -mt'
#Pass a process to be searched. Ex ~: psg bash
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'


################
#System Aliases#
################
alias df='df -Tha --total'
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias wget='wget -c'
alias du='du -ch'
alias diff='colordiff'
alias mount='mount |column -t'
alias myip='curl http://ipecho.net/plain; echo'

##############
#Misc Aliases#
##############
alias sha1='openssl sha1'
alias update='sudo apt-get update && sudo apt-get upgrade --yes'

alias ping='ping -c 2'

###########
#Functions#
###########
#########
#EXTRACT#
#########
#Screw trying to remember extraction commands
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}


# Bash Prompt - User
# PS1="[\[$(tput sgr0)\]\[\033[38;5;11m\]\@\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;14m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;208m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\]"
