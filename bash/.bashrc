export EDITOR=/usr/bin/vim
export PS1="\[\033[92m\]\w/ \[\033[33m\]\$ \[\033[m\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFh'
alias ll='ls -l'
alias l='ls -la'
alias md='mkdir -p'
alias ..='cd ..'
alias grep='grep --color=auto -n'

# add home bin if it exists
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
