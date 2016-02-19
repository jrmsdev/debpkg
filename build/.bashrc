export HOME=/build

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

HOSTNAME=`basename $DOCKER_IMG`
export PS1="\[\e]0;${USER}@${HOSTNAME}: \w\a\]\[\033[01;32m\]${HOSTNAME}\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "

if [ -s ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PAGER=less
