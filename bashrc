
# Check for an interactive session
[ -z "$PS1" ] && return

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

# History file: (must haves for those that use the command line alot)
# Increase history file size,
# increase number of commands saved (default: 500),
# append commands instead of overwriting (nice for two or more sessions),
# add command to history after executing,
# don't put duplicate lines in history, ignore same successive entries.
export HISTFILESIZE=20000
export HISTSIZE=5000
shopt -s histappend
#PROMPT_COMMAND='history -a'
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# For Make
export CONCURRENCY_LEVEL=$(($(grep processor /proc/cpuinfo | wc -l)))

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Extended pattern matching features
#shopt -s extglob

# Bash completion extended
#set show-all-if-ambiguous on

# Allow 'less' to view non-text files (allows viewing of compressed files)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim                           # for crontab

export GREP_COLOR="1;32"                    # green
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias less='less -R'
alias finserial='cu -s 115200 --nostop -t -l'

ATHEROS=$HOME/toolchains/Atheros_7_1_3_77_05_2009
ATHEROS_BIN=$ATHEROS/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin
CODESOURCERY=$HOME/toolchains/CodeSourcery
CODESOURCERY_BIN=$CODESOURCERY/Sourcery_G++_Lite/bin
ARM=$HOME/toolchains/arm-none-linux-gnueabi
ARM_SYS=$ARM/arm-none-linux-gnueabi/sysroot
ARM_USR=$ARM_SYS/usr
ARM_BIN=$ARM/bin
PATH=$PATH:$ATHEROS_BIN:$CODESOURCERY_BIN:$ARM_BIN
PATH=$PATH:$ARM_BIN

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

export ATHEROS
export ATHEROS_BIN
export CODESOURCERY
export CODESOURCERY_BIN

export chans=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 34 36 38 40 42 44 46 48 52 56 60
		64 100 104 108 112 116 120 124 128 132 136 140 149 153 157 161
		165)
set -o vi
