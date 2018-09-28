# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.sharedrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

if [ -t 1 ]; then
bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'
bind '"\C-q": "%-\n"'
fi

export HISTIGNORE="%*"

[ -z "$PS1" ] || stty -ixon

prefix=
if [ -n "$SSH_CONNECTION" ]; then
  prefix="\[\033[01;33m\]\u@\h"
else
  prefix="\[\033[01;32m\]\u@\h"
fi

[ -z "$PS1" ] || export PS1="$prefix\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export PS1="\[\033[01;36m\]\W\[\033[95m\]\$(git_prompt_info '[%s]')\[\033[01;94m\]> \[\033[01;00m\]"

eval "$(hub alias -s)"

alias longtest="./node_modules/.bin/lab --lint"
eval "$(/Users/micah.cooper/hashrocket/dotmatrix/hr/bin/hr init -)"

function grm () {
  echo "git rebase master"
  command git rebase master
}

function gwip () {
  echo "git commit -a -m wip"
  command git commit -a -m wip
}

function gush () {
  echo "git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease"
  git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease
}

gri() {
  echo "git rebase -i HEAD~$1"
  command git rebase -i HEAD~$1
}

function gmpr () {
  echo "git checkout master && git pull --rebase origin master"
  git checkout master && git pull --rebase origin master
}

flint() {
  echo "./node_modules/.bin/eslint --fix $1"
  command ./node_modules/.bin/eslint --fix $1
}

tember() {
  echo "ember test --server --filter=\"$1\""
  command ember test --server --filter="$1"
}

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

source ~/.profile
