# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export EDITOR=emacsclient
# User specific aliases and functions
PS1="(\d) - \[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u@\H\[\033[1;33m\]-> \[\033[0m\]"

set -o vi
