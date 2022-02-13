#!/usr/bin/env bash

# set 256 color profile where possible
if infocmp screen-256color >/dev/null 2>&1; then
    export TERM=screen-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color 
fi

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

#enable vi mode in bash
set -o vi

# PATH EXPORTS
#{{{ Vim as Editor 
    export VISUAL=vim
    export EDITOR=vim
#}}}
# {{{ Locale 
    export LANG="en_US.UTF-8"
    export LC_COLLATE="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export LC_MESSAGES="en_US.UTF-8"
    export LC_MONETARY="en_US.UTF-8"
    export LC_NUMERIC="en_US.UTF-8"
    export LC_TIME="en_US.UTF-8"
    export LC_ALL="en_US.UTF-8"
# }}}
