
# Check for an interactive session
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#PS1='[\u@\h \W]\$ '
BLACK='\[\033[02;30m\]'
RED='\[\033[02;31m\]'
GREEN='\[\033[02;32m\]'
YELLOW='\[\033[02;33m\]'
BLUE='\[\033[02;34m\]'
MAGENTA='\[\033[02;35m\]'
CYAN='\[\033[02;36m\]'
WHITE='\[\033[02;37m\]'
STOP='\[\033[00m\]'

PS1="${CYAN}[${GREEN}\u${CYAN}@${GREEN}\h${CYAN} \W]${STOP}\$ "

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias less='less -R'
alias finserial='cu -s 115200 --nostop -t -l'

export CONCURRENCY_LEVEL=$(($(grep processor /proc/cpuinfo | wc -l) + 1))

ATHEROS=$HOME/toolchains/Atheros_7_1_3_77_05_2009
ATHEROS_BIN=$ATHEROS/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin
CODESOURCERY=$HOME/toolchains/CodeSourcery
CODESOURCERY_BIN=$CODESOURCERY/Sourcery_G++_Lite/bin
PATH=$PATH:$ATHEROS_BIN:$CODESOURCERY_BIN

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

export ATHEROS
export ATHEROS_BIN
export CODESOURCERY
export CODESOURCERY_BIN

export GOPATH=$HOME/go

export EDITOR=vim

export chans=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 34 36 38 40 42 44 46 48 52 56 60
		64 100 104 108 112 116 120 124 128 132 136 140 149 153 157 161
		165)
#set -o vi
