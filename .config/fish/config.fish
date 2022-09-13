if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GOPATH $HOME/go
# set -x PATH $HOME/.asdf/installs/rust/stable/bin $PATH
set -x PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $PATH
set -x PATH $PATH /Applications/Visual Studio Code.app/Contents/Resources/app/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH /usr/local/opt/qt@5/bin $PATH
set -x PATH $PATH /opt/homebrew/bin
# set -x PATH $HOME/.cargo/env:$PATH
set -Up fish_user_paths ~/.cargo/bin

alias dit="yadm"
alias dlg='yadm log --graph --oneline --decorate --color --all'
alias dot="yadm"
alias dps="docker ps -a"
alias dpsi="docker ps -aq"
alias dst="yadm status"
alias free='free -m'                      # show sizes in MB
alias h='heroku'
alias keyboard='setxkbmap -option ctrl:nocaps && xset r rate 220 48'
alias more=less
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

