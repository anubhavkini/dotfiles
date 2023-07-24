# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ -d $XDG_CONFIG_HOME/bash ]; then
	for rc in $XDG_CONFIG_HOME/bash/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
