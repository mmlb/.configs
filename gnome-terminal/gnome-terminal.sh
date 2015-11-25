#!/usr/bin/env bash
# Gnome Terminal color scheme install script
# Adapted from base16

function die {
	echo -e "$@" >&2
	exit 1
}

function dset {
    local key="$1"; shift
    local val="$1"; shift

    if [[ "$type" == "string" ]]; then
        val="'$val'"
    fi

    dconf write "$PROFILE_KEY/$key" "$val"
}

# because dconf still doesn't have "append"
function dlist_append {
    local key="$1"; shift
    local val="$1"; shift

    local entries="$(
        {
            dconf read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
            echo "'$val'"
        } | head -c-1 | tr "\n" ,
    )"

    dconf write "$key" "[$entries]"
}

usage='usage: gnome-terminal.sh save profile-name\n       gnome-terminal.sh load saved-profile'
(( $# == 2 )) || die $usage

action=$1
case $action in
	'load')
		profile=$2
		[[ -f $profile ]] || die "can't read profile: $profile"

		profile_name="$(awk -F= '/visible-name/ {print $2}' $saved_profile)"
		[[ -z $profile_name ]] && die "unable to parse profile"
		;;
	'save')
		profile_name="'$2'"
		;;
	*) die $usage ;;
esac

#check that uuidgen ability is available
if which uuidgen &>/dev/null; then
	:
elif [[ -f /proc/sys/kernel/random/uuid ]]; then
	function uuidgen { cat /proc/sys/kernel/random/uuid; }
else
	die "missing uuidgen ability via either program or kernel file"
fi

BASE_KEY=/org/gnome/terminal/legacy/profiles:
if [[ -z "$(dconf list $BASE_KEY/)" ]]; then
	die "unable to find profiles \"dir\": $BASE_KEY"
fi

function save {
	cat $3
}

function load {
	diff -u $2 $3
	ret=$?
	if (( $ret == 0 )); then
		echo "profile exists and is unchanged"
	fi
	return $ret
}

for profile_id in $(dconf list $BASE_KEY/ | grep /$); do
	tmp=$(mktemp)
	dconf dump $BASE_KEY/$profile_id | sort > $tmp
	name=$(awk -F= '/visible-name/ {print $2}' $tmp)
	if [[ $name ==  $profile_name ]]; then
		found=true
		$action $profile_name $profile $tmp
	fi
	rm $tmp
	[[ -n $found ]] && exit $ret
done

echo "profile not found, loading from saved"
uuid=$(uuidgen)
PROFILE_KEY="$BASE_KEY/:$uuid"

# load settings from saved profile
dconf load "$PROFILE_KEY/" < $profile

# add new copy to list of profiles
dlist_append $BASE_KEY/list "$uuid"
