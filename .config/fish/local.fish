set -p PATH $HOME/.config/rofi/bin
fish_add_path -p .cargo/bin/
# source $HOME/.cargo/env

export HISTCONTROL=erasedups
export HISTIGNORE="%*"
export VISUAL=nvim
export EDITOR=nvim
export HISTSIZE=10000
export LESS="FRX"
export LSCOLORS=gxgxcxdxbxegedabagacad
export PSQL_EDITOR='vim -c"setf sql"'
export RI="--format ansi -T"
# for HiDpi
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export DOCKER_BUILDKIT=1

#Use this for alacritty
export TERM=xterm-256color
# Use this for kitty
# export TERM=xterm-kitty
#
#
# save pwd to a temp file so i3 can use it to open another terminal in the same directory
# export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# erlang/elixir Env Vars
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS=no
export KERL_INSTALL_HTMLDOCS=no
export KERL_INSTALL_MANPAGES=no

alias dit="yadm"
alias dlg='yadm log --graph --oneline --decorate --color --all'
alias dot="yadm"
alias dps="docker ps -a"
alias dpsi="docker ps -aq"
alias dst="yadm status"
alias free='free -m'                      # show sizes in MB
alias gamend='git commit --amend -C HEAD'
alias gap='git add --patch'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcam='command git commit --amend -C HEAD'
alias gcl='git clean -f -d'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias glg='git log --graph --oneline --decorate --color --all'
alias glod='git log --oneline --decorate'
alias gmpr='git checkout master && git pull --rebase origin master --autostash'
alias gnpr='git checkout main && git pull --rebase origin main --autostash'
alias gnap='git add -N --ignore-removal . && gap && gref'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grm='command git rebase master --autostash'
alias grom='command git rebase origin/master --autostash'
alias gst='git status'
alias gull='git pull --rebase origin (git rev-parse --abbrev-ref HEAD)'
alias gush='git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'
alias gwip='echo "git commit -a -m wip"; command git commit -a -m wip'
alias pacmanclean='echo "sudo pacman -Rns (pacman -Qtdq)"; sudo pacman -Rns (pacman -Qtdq)'
alias pgdisable='systemctl disable postgresql.service'
alias pgenable='systemctl enable postgresql.service'
alias pgrestart='systemctl restart postgresql.service'
alias pgstart='systemctl start postgresql.service'
alias pgstop='systemctl stop postgresql.service'

alias keyboard='xset r rate 220 48; setxkbmap -option "ctrl:nocaps"'
alias k='xset r rate 220 48; setxkbmap -option "ctrl:nocaps"'
alias colors='alacritty-colorscheme apply (alacritty-colorscheme list | fzf )'
alias color='alacritty-colorscheme status'

alias record='sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video4'

alias kt='kitty --session ~/code/codepun/config/startup_session.kitty.conf'
lab completion | source

alias screencast='\
xrandr --setmonitor virtual-left 4096/947x2160/457+0+0 DisplayPort-0 &&\
xrandr --setmonitor virtual-right 1024/947x2160/457+4096+0 none'

alias noscreencast='\
xrandr --delmonitor virtual-left &&\
xrandr --delmonitor virtual-right'

alias money='\
xrandr --setmonitor virtual-left 1920/947x1080/457+0+0 DisplayPort-0 &&\
xrandr --setmonitor virtual-right 3200/947x1920/457+1920+0 none &&\
xrandr --setmonitor virtual-bottom 5120/947x1080/457+0+1080 none'

alias nomoney='\
xrandr --delmonitor virtual-left &&\
xrandr --delmonitor virtual-right &&\
xrandr --delmonitor virtual-bottom'
