#
# ~/.bashrc
#

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

source ~/.git-prompt.sh

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    # PS1='\[\033[01;36m\]\W\[\033[01;32m\]$(__git_ps1 "[%s]")\[\033[01;36m\]• '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# export PS1='\[\033[01;36m\]\W\[\033[01;32m\]$(__git_ps1 "[%s]")\[\033[01;36m\]• '
export PS1="\[\033[01;36m\]\W\[\033[95m\]\$(__git_ps1 '[%s]')\[\033[01;94m\]=> \[\033[01;00m\]"
export CLICOLOR=1
export EDITOR="$VISUAL"
export ERL_AFLAGS="-kernel shell_history enabled"
export HISTCONTROL=erasedups
export HISTIGNORE="%*"
export HISTSIZE=10000
export LESS="FRX"
export LSCOLORS=gxgxcxdxbxegedabagacad
export PSQL_EDITOR='vim -c"setf sql"'
export RI="--format ansi -T"
export VISUAL=vim

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit -v'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gca='git commit -a -v'
alias gcl='git clean -f -d'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias glg='git log --graph --oneline --decorate --color --all'
alias glod='git log --oneline --decorate'
alias glod='git log --oneline --decorate'
alias glp='git log -p'
alias gnap='git add -N --ignore-removal . && gap && gref'
alias gp='git push'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gst='git status'
alias ll='ls -l'
alias neorestart='~/neo4j-community-3.2.2/bin/neo4j restart'
alias neostart='~/neo4j-community-3.2.2/bin/neo4j start'
alias neostop='~/neo4j-community-3.2.2/bin/neo4j stop'
alias pgstart='sudo /etc/init.d/postgresql start'
alias pgstop='sudo /etc/init.d/postgresql stop'
alias redisstart='sudo /etc/init.d/redis_6379 start'
alias redisstop='sudo /etc/init.d/redis_6379 stop'
alias reset-authors='git commit --amend --reset-author -C HEAD'
alias vi='vim'
alias longtest="./node_modules/.bin/lab --lint"
alias longtest="./node_modules/.bin/lab --lint"

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

# # ex - archive extractor; usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
