# ~/.bashrc

[[ $- != *i* ]] && return

use_color=true

# shell options
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
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
export VISUAL=nvim
# for HiDpi
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export TERM=xterm-256color
# save pwd to a temp file so i3 can use it to open another terminal in the same directory
export PROMPT_COMMAND="pwd > /tmp/whereami; history -a"
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

alias ?="whoami && hostname && pwd"
alias copy='xclip -selection clipboard'
alias d="docker"
alias df='df -h'                          # human-readable sizes
alias di="docker images"
alias dii="docker images -q"
alias dit="yadm"
alias dlg='yadm log --graph --oneline --decorate --color --all'
alias dot="yadm"
alias dps="docker ps -a"
alias dpsi="docker ps -aq"
alias dst="yadm status"
alias free='free -m'                      # show sizes in MB
alias gamend='echo "git commit --amend -C HEAD"; git commit --amend -C HEAD'
alias gap='echo "git add --patch";git add --patch'
alias gb='echo git_branch;git branch'
alias gc='echo git commit -v;git commit -v'
alias gca='echo git commit -v;git commit -a -v'
alias gcam='echo "git commit --amend -C HEAD";command git commit --amend -C HEAD'
alias gcl='echo git commit -v;git clean -f -d'
alias gco='echo git checkout;git checkout'
alias gd='echo git diff;git diff'
alias gdc='echo git diff --cached;git diff --cached'
alias glg='echo git log --graph --oneline --decorate --color --all;git log --graph --oneline --decorate --color --all'
alias glod='echo git log --oneline --decorate;git log --oneline --decorate'
alias gmpr='echo "git checkout master && git pull --rebase origin master --autostash"; git checkout master && git pull --rebase origin master --autostash'
alias gnap='echo git add -N --ignore-removal . && gap && gref;git add -N --ignore-removal . && gap && gref'
alias gpr='echo git pull --rebase;git pull --rebase'
alias gr='ectho git rebasse;git rebase'
alias gra='echo "git rebase --abort";git rebase --abort'
alias grc='echo "git rebase --continue";git rebase --continue'
alias grm='echo "git rebase master";command git rebase master --autostash'
alias grom='echo "git rebase origin/master"; command git rebase origin/master --autostash'
alias gst='echo "git status";git status'
alias gull='echo "git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)"; git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gush='echo "git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease"; git push origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease'
alias gwip='echo "git commit -a -m wip"; command git commit -a -m wip'
alias h='heroku'
alias keyboard='setxkbmap -option ctrl:nocaps && xset r rate 220 48'
alias ll='ls -l'
alias more=less
alias neorestart='~/neo4j-community-3.2.2/bin/neo4j restart'
alias neostart='~/neo4j-community-3.2.2/bin/neo4j start'
alias neostop='~/neo4j-community-3.2.2/bin/neo4j stop'
alias nfig='echo "nvim ~/.config/nvin/init.vim"; command nvim ~/.config/nvim/init.vim'
alias pacmanclean='echo "sudo pacman -Rns $(pacman -Qtdq)"; sudo pacman -Rns $(pacman -Qtdq)'
alias pgdisable='systemctl disable postgresql.service'
alias pgenable='systemctl enable postgresql.service'
alias pgrestart='systemctl restart postgresql.service'
alias pgstart='systemctl start postgresql.service'
alias pgstop='systemctl stop postgresql.service'
alias record='sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video4'
alias redisstart='sudo /etc/init.d/redis_6379 start'
alias redisstop='sudo /etc/init.d/redis_6379 stop'
alias uuid='uuidgen | xclip -selection clipboard'
alias vpn-status="/opt/cisco/anyconnect/bin/vpn -s status"
alias vpn="/opt/cisco/anyconnect/bin/vpn -s connect AmerEast-1"
alias vpoff="/opt/cisco/anyconnect/bin/vpn -s disconnect"

gri()
{
  echo "git rebase -i HEAD~$1"
  command git rebase -i HEAD~$1
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

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(starship init bash)"

source ~/.sendgrid

