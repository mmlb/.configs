# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(golang systemd taskwarrior vundle)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/site-contrib/powerline.zsh

# Customize to your needs...
export PATH=$PATH:/home/mmendez/bin:/home/mmendez/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/share/java/cppncss/bin:/usr/bin/core_perl:/home/mmendez/toolchains/Atheros_7_1_3_77_05_2009/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin:/home/mmendez/toolchains/CodeSourcery/Sourcery_G++_Lite/bin:/home/mmendez/toolchains/Atheros_7_1_3_77_05_2009/build/gcc-3.4.4-2.16.1/build_mips_nofpu/bin:/home/mmendez/toolchains/CodeSourcery/Sourcery_G++_Lite/bin:/home/mmendez/toolchains/arm-none-linux-gnueabi/bin/
export LESS="FRSX"
export EDITOR=vim
export VISUAL=vim
