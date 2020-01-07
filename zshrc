source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

unset TERMINFO

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$UID}

typeset -U PATH path
export GDK_BACKEND=wayland
export EDITOR=nvim
export KEYTIMEOUT=1
export LESS="AFRSX"
export MAKEFLAGS="-j$(($(nproc) + 1))"
export MANPAGER="nvim -c 'set ft=man' -"
#export MESA_GLSL_VERSION_OVERRIDE=430
#export MESA_GL_VERSION_OVERRIDE=4.30
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.zplug/bin:$PATH:$(realpath $(dirname $($HOME/bin/realwhich git))/../share/git/contrib/diff-highlight)
[[ -d $HOME/go/src/github.com/packethost/eng-tools/bin ]] && export PATH=$PATH:$HOME/go/src/github.com/packethost/eng-tools/bin
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export TERM=xterm
#export TERMINAL=alacritty
export TMPDIR="$XDG_RUNTIME_DIR/tmp"
export VISUAL="$EDITOR"
export XKB_DEFAULT_OPTIONS='ctrl:nocaps'

tmpdirs=(chromium cm google-chrome mozilla tmp)
for tmpdir in ${tmpdirs[@]}; do
	[[ -d $XDG_RUNTIME_DIR/$tmpdir ]] || mkdir $XDG_RUNTIME_DIR/$tmpdir
done

if [[ -z $ZSH_NO_EXEC_ELVISH ]]; then
	exec elvish
fi

HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
setopt extendedglob histignorealldups notify sharehistory
setopt auto_cd auto_pushd pushd_ignore_dups

bindkey -v
zstyle :compinstall filename '/home/manny/.zshrc'

use_zplugin() {
	source ~/.zplugin/bin/zplugin.zsh

	zplugin load 'andrewferrier/fzf-z'
	zplugin load 'mafredri/zsh-async'
	zplugin load 'romkatv/powerlevel10k'
	zplugin load 'Tarrasch/zsh-bd'
	zplugin load 'willghatch/zsh-saneopt'
	zplugin load 'zdharma/fast-syntax-highlighting'
	zplugin load 'zdharma/history-search-multi-word'
	zplugin load 'zsh-users/zsh-autosuggestions'
	zplugin load 'zsh-users/zsh-history-substring-search'
}

use_zplugin

autoload -Uz compinit
compinit

FZFZ_RECENT_DIRS_TOOL=fasd

use_zplug() {
	source ~/.zplug/init.zsh
	#FILTHY_SHOW_EXIT_CODE=1
	#zplug 'RobSis/zsh-completion-generator'
	#zplug 'knu/z', use:z.sh, defer:2
	#zplug 'larkery/zsh-histdb', defer:3
	#zplug 'molovo/filthy'
	#zplug 'rupa/z', use:z.sh
	#zplug 'zsh-users/zsh-syntax-highlighting', defer:2
	zplug 'andrewferrier/fzf-z'
	zplug 'mafredri/zsh-async'
	zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme
	zplug 'Tarrasch/zsh-bd'
	zplug 'willghatch/zsh-saneopt'
	zplug 'zdharma/fast-syntax-highlighting', defer:2
	zplug 'zdharma/history-search-multi-word'
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug 'zsh-users/zsh-autosuggestions', defer:3
	zplug 'zsh-users/zsh-history-substring-search', defer:3

	# Install plugins if there are plugins that have not been installed
	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo
			zplug install
		fi
	fi

	# Then, source plugins and add commands to $PATH
	zplug load
}

use_zgen() {
	# load zgen
	source "${HOME}/.zgen/zgen.zsh"
	# if the init script doesn't exist
	if ! zgen saved; then

		# specify plugins here
		zgen 'andrewferrier/fzf-z'
		zgen 'mafredri/zsh-async'
		zgen 'romkatv/powerlevel10k'
		zgen 'Tarrasch/zsh-bd'
		zgen 'willghatch/zsh-saneopt'
		zgen 'zdharma/fast-syntax-highlighting', defer:2
		zgen 'zdharma/history-search-multi-word'
		zgen 'zsh-users/zsh-autosuggestions'
		zgen 'zsh-users/zsh-history-substring-search'

		# generate the init script from plugins above
		zgen save
	fi
}

#use_zplug


alias cp='cp --reflink=auto'
alias dc='docker-compose'
alias grep='grep --color=auto'
alias l='ls -1'
alias ls='ls --color=auto'
alias nix-shell='command nix-shell --command zsh '
alias please=sudo
alias ssh='TERM=xterm ssh'
alias tar='bsdtar'
alias tf='terraform'
alias vim='nvim'
alias xargs='xargs -I "{}" -n 1 -P $(nproc)'

_zsh_autosuggest_strategy_histdb_top() {
	local query="select commands.argv from
	history left join commands on history.command_id = commands.rowid
	left join places on history.place_id = places.rowid
	where commands.argv LIKE '$(sql_escape $1)%'
	group by commands.argv
	order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
	suggestion=$(_histdb_query "$query")
}
#ZSH_AUTOSUGGEST_STRATEGY=histdb_top

#(wal -r &)

fpath=(~/.config/zsh/completions $fpath)

eval "$(direnv hook zsh)"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
POWERLEVEL9K_GITSTATUS_DIR=${$(which gitstatusd):A:h:h}
source ~/configs/zsh/purepower.zsh
