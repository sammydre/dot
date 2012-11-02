#!/bin/bash

function linkdot() {
	src=`pwd`/$1
	dest=$(echo "$2" | sed 's!^~!'"${HOME}"'!')

	if [ -a "$dest" -o -d "$dest" ] || readlink -q "$dest" >/dev/null; then
		echo "$dest already exists! ignoring (" `readlink "$dest"` ")"
		return
	fi

	dest_dir=$(dirname "$dest")

	if [ ! -d $dest_dir ]; then
		echo "dir $dest_dir for $dest does not exist! ignoring"
		return
	fi

	echo ln -s "$src" "$dest"
	ln -s "$src" "$dest"
}

linkdot 	"config/tint2/tint2rc" 	"~/.config/tint2/tint2rc"
linkdot 	"config/openbox" 	"~/.config/openbox"
linkdot 	"vim/.vimrc" 		"~/.vimrc"
linkdot 	"vim/.gvimrc" 		"~/.gvimrc"
linkdot 	"vim/.vim" 		"~/.vim"

# vim: ts=8 sw=8 sts=8
