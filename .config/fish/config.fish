fish_add_path $HOME/go \
    $GOPATH/bin \
    $HOME/.asdf/installs/rust/stable/bin \
    $HOME/.cargo/bin \
    $HOME/.cargo/env \
    $HOME/.config/yarn/global/node_modules/.bin \
    $HOME/.yarn/bin \
    $HOME/google-cloud-sdk/path.fish.inc \
    /Applications/Visual Studio Code.app/Contents/Resources/app/bin \
    /opt/homebrew/bin \
    /usr/local/opt/qt@5/bin

set -x GOPATH $HOME/go
set -x HISTCONTROL erasedups
set -x HISTIGNORE "%*"
set -x VISUAL nvim
set -x EDITOR nvim
set -x HISTSIZE 10000
set -x LESS "FRX"
set -x LSCOLORS gxgxcxdxbxegedabagacad
set -x PSQL_EDITOR 'nvim -c "setf sql"'
set -x RI "--format ansi -T"
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc
# for HiDpi
set -x QT_AUTO_SCREEN_SCALE_FACTOR 1
set -x GDK_SCALE 2
set -x DOCKER_BUILDKIT 1
#Use this for alacritty
set -x TERM xterm-256color
# erlang/elixir Env Vars
set -x KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac"
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_BUILD_DOCS no
set -x KERL_INSTALL_HTMLDOCS no
set -x KERL_INSTALL_MANPAGES no

abbr --add c circleci
abbr --add color alacritty-colorscheme status
abbr --add colors 'alacritty-colorscheme apply (alacritty-colorscheme list | fzf )'
abbr --add d docker
abbr --add df df -h                          # human-readable sizes
abbr --add di docker images
abbr --add dii docker images -a -q
abbr --add dit yadm
abbr --add dlg yadm log --graph --oneline --decorate --color --all
abbr --add dot yadm
abbr --add dps docker ps -a
abbr --add dpsi docker ps -aq
abbr --add dst yadm status
abbr --add free free -m                      # show sizes in MB
abbr --add h heroku
abbr --add k 'xset r rate 220 48; setxkbmap -option ctrl:nocaps'
abbr --add keyboard 'xset r rate 220 48; setxkbmap -option ctrl:nocaps'
abbr --add kace kubespace
abbr --add kns kubens
abbr --add kt kitty --session ~/code/codepun/config/startup_session.kitty.conf
abbr --add kx kubectx
abbr --add l1 exa --oneline
abbr --add la exa --all --long --header --classify --git
abbr --add lg exa --long --header --classify --git -s modified --grid
abbr --add ls exa --long --header --classify --git
abbr --add lsd exa --only-dirs --long --header --git
abbr --add mk minikube
abbr --add more less
abbr --add nfig command nvim ~/.config/nvim/init.vim
abbr --add pacman 'sudo pacman -Rns (pacman -Qtdq)'
abbr --add pgdisable systemctl disable postgresql.service
abbr --add pgenable systemctl enable postgresql.service
abbr --add pgrestart systemctl restart postgresql.service
abbr --add pgstart systemctl start postgresql.service
abbr --add pgstop systemctl stop postgresql.service
abbr --add pm podman
abbr --add tf terraform
abbr --add uuid 'uuidgen | xclip -selection clipboard'
abbr --add vpn-status /opt/cisco/anyconnect/bin/vpn -s status
abbr --add vpn /opt/cisco/anyconnect/bin/vpn -s connect AmerEast-1
abbr --add vpoff /opt/cisco/anyconnect/bin/vpn -s disconnect

alias record='\
    sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && \
    gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video4'

alias screencast='\
    xrandr --setmonitor virtual-left 4096/947x2160/457+0+0 DisplayPort-0 && \
    xrandr --setmonitor virtual-right 1024/947x2160/457+4096+0 none'

alias noscreencast='\
    xrandr --delmonitor virtual-left && \
    xrandr --delmonitor virtual-right'

alias money='\
    xrandr --setmonitor virtual-left 1920/947x1080/457+0+0 DisplayPort-0 && \
    xrandr --setmonitor virtual-right 3200/947x1920/457+1920+0 none && \
    xrandr --setmonitor virtual-bottom 5120/947x1080/457+0+1080 none'

alias nomoney='\
    xrandr --delmonitor virtual-left && \
    xrandr --delmonitor virtual-right && \
    xrandr --delmonitor virtual-bottom'

starship init fish | source

source_existing '~/.asdf/asdf.fish'
source_existing /opt/asdf-vm/asdf.fish
source_existing /opt/homebrew/opt/asdf/libexec/asdf.fish
source_existing ~/.git_aliases.fish
source_existing /home/micah/.config/op/plugins.sh
