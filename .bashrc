#
# ~/.bashrc
#
source ~/.git-prompt.sh
source ~/.git-completion.bash

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
# export PS1="\h:\[\033[01;36m\]\W\[\033[95m\]\$(__git_ps1 '[%s]')\[\033[01;94m\]> \[\033[01;00m\]"
# export PS1="\[\033[01;36m\]\W\[\033[95m\]\$(__git_ps1 ' ⥈ %s')\[\033[01;94m\] -> \[\033[01;00m\]"
export PS1="\[\033[01;36m\]\w\[\033[95m\]\$(__git_ps1 ' ⥸ %s')\n• \[\033[01;94m\]\[\033[01;00m\]"
export CLICOLOR=1
export EDITOR="$VISUAL"
# export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
export HISTCONTROL=erasedups
export HISTIGNORE="%*"
export HISTSIZE=10000
export LESS="FRX"
export LSCOLORS=gxgxcxdxbxegedabagacad
export PSQL_EDITOR='vim -c"setf sql"'
export RI="--format ansi -T"
export VISUAL=nvim
# for HiDpi
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export TERM=xterm-256color
# save pwd to a temp file so i3 can use it to open another terminal in the same
# directory
export PROMPT_COMMAND="pwd > /tmp/whereami"

#salesforcedocs
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

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
alias pgstart='systemctl start postgresql.service'
alias pgstop='systemctl stop postgresql.service'
alias pgrestart='systemctl restart postgresql.service'
alias pgenable='systemctl enable postgresql.service'
alias pgdisable='systemctl disable postgresql.service'
alias redisstart='sudo /etc/init.d/redis_6379 start'
alias redisstop='sudo /etc/init.d/redis_6379 stop'
alias reset-authors='git commit --amend --reset-author -C HEAD'
alias vi='vim'
alias longtest="./node_modules/.bin/lab --lint"
alias longtest="./node_modules/.bin/lab --lint"

alias dot="yadm"
alias dit="yadm"
alias dst="yadm status"
alias dlg='yadm log --graph --oneline --decorate --color --all'

alias d="docker"
alias di="docker images"
alias dii="docker images -q"
alias dps="docker ps -a"
alias dpsi="docker ps -aq"

alias uuid='uuidgen | xclip -selection clipboard'
alias h='heroku'
alias copy='xclip -selection clipboard'
alias monitor='xrandr --auto'

function pacmanclean () {
  echo "sudo pacman -Rns $(pacman -Qtdq)"
  Command sudo pacman -Rns $(pacman -Qtdq)
}

function nfig () {
  echo "nvim ~/.config/nvin/init.vim"
  command nvim ~/.config/nvim/init.vim
}

function grm () {
  echo "git rebase master"
  command git rebase master --autostash
}

function gwip () {
  echo "git commit -a -m wip"
  command git commit -a -m wip
}

function gush () {
  echo "git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease"
  git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease
}

function gri() {
  echo "git rebase -i HEAD~$1"
  command git rebase -i HEAD~$1
}

function gmpr () {
  echo "git checkout master && git pull --rebase origin master --autostash"
  git checkout master && git pull --rebase origin master --autostash
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

RIPGREP_CONFIG_PATH="~/.ripgreprc"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
