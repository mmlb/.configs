export TERMINAL=gnome-terminal
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

#PS1='[\u@\h \W]\$ '

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias less='less -R'
alias finserial='cu -s 115200 --nostop -t -l'

export JOBS=$(($(grep processor /proc/cpuinfo | wc -l) + 1))
alias mmake="make -j$JOBS"

ATHEROS=$HOME/toolchains/Atheros_7_1_3_77_05_2009
ATHEROS_BIN=$ATHEROS/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin
CODESOURCERY=$HOME/toolchains/CodeSourcery
CODESOURCERY_BIN=$CODESOURCERY/Sourcery_G++_Lite/bin
PATH=$PATH:$ATHEROS_BIN:$CODESOURCERY_BIN

export ATHEROS
export ATHEROS_BIN
export CODESOURCERY
export CODESOURCERY_BIN

export EDITOR=vim

export chans=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 34 36 38 40 42 44 46 48 52 56 60 64 100 104 108 112 116 120 124 128 132 136 140 149 153 157 161 165)

BOLD=$(tput bold)
DIM=$(tput dim)
BLACK=$(tput setf 0)
BLUE=$(tput setf 1)
GREEN=$(tput setf 2)
CYAN=$(tput setf 3)
CYAN='\[\033[02;36m\]'
RED=$(tput setf 4)
MAGENTA=$(tput setf 5)
YELLOW=$(tput setf 6)
WHITE=$(tput setf 7)
CLEAR=$(tput sgr0)

PS1="$CLEAR$CYAN[$GREEN\u$CYAN@$GREEN\h$CYAN \W]$CLEAR\$ "

#set -o vi
