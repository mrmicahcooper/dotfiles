if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GOPATH $HOME/go
set -x PATH $HOME/.asdf/installs/rust/stable/bin $PATH
set -x PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $PATH
set -x PATH $PATH /Applications/Visual Studio Code.app/Contents/Resources/app/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH /usr/local/opt/qt@5/bin $PATH
set -x PATH $PATH /opt/homebrew/bin
set -x PATH $HOME/.cargo/env:$PATH

set -Up fish_user_paths ~/.cargo/bin

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
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

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
alias h='heroku'
alias keyboard='setxkbmap -option ctrl:nocaps && xset r rate 220 48'
alias k='xset r rate 220 48; setxkbmap -option "ctrl:nocaps"'
alias more=less

alias colors='alacritty-colorscheme apply (alacritty-colorscheme list | fzf )'
alias color='alacritty-colorscheme status'

alias neorestart='~/neo4j-community-3.2.2/bin/neo4j restart'
alias neostart='~/neo4j-community-3.2.2/bin/neo4j start'
alias neostop='~/neo4j-community-3.2.2/bin/neo4j stop'
alias nfig=' command nvim ~/.config/nvim/init.vim'
alias pacmanclean='echo "sudo pacman -Rns (pacman -Qtdq)"; sudo pacman -Rns (pacman -Qtdq)'
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

alias k="kubectl"
alias kns="kubens"
alias kx="kubectx"
alias kace="kubespace"
alias mk="minikube"
alias c="circleci"
alias d="docker"
alias df='df -h'                          # human-readable sizes
alias di="docker images"
alias dii="docker images -a -q"

alias l1='exa --oneline'
alias la='exa --all --long --header --classify --git'
alias lg='exa --long --header --classify --git -s modified --grid'
alias ls='exa --long --header --classify --git'
alias lsd='exa --only-dirs --long --header --git'

alias tf=terraform

alias record='sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video4'

alias kt='kitty --session ~/code/codepun/config/startup_session.kitty.conf'

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

starship init fish | source

if test -f ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

if test -f /opt/asdf-vm/asdf.fish
    source /opt/asdf-vm/asdf.fish
end
if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

source ~/.git_aliases.fish

