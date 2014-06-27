# Customize to your needs...
# source zshrc.omz
source configs/zshrc.antigen

export LESS="FRSX"
export EDITOR=vim
export VISUAL=vim
export MAKEFLAGS="-j$(($(grep processor /proc/cpuinfo | wc -l) + 1))"

add_path()
{
	[[ -d $1 ]] || return
	[[ -n $PREPEND ]] && PATH=$1:$PATH || PATH=$PATH:$1
}
PREPEND=yes add_path $HOME/bin
add_path /usr/bin/core_perl

tc=$HOME/toolchains
add_path $tc/Atheros_7_1_3_77_05_2009/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin
add_path $tc/CodeSourcery/Sourcery_G++_Lite/bin
add_path $tc/arm-none-linux-gnueabi/bin/
unset tc
unset -f add_path

export PATH
