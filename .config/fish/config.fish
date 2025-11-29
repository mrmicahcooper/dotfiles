fish_add_path /opt/homebrew/bin \
    /usr/local/bin \
    /Applications/Postgres.app/Contents/Versions/latest/bin \
    /opt/homebrew/opt/curl/bin \
    /Users/micahcooper/.mix/escripts \
    # /nix/store/m59acjj1jqx3jzm6h412q5yqrqynf06s-elixir-1.17.3/bin/mix
    # $HOME/go \
    # $HOME/.asdf/installs/rust/stable/bin \
    # $HOME/.cargo/bin \
    # $HOME/.cargo/env \
    # $HOME/.config/yarn/global/node_modules/.bin \
    # $HOME/.yarn/bin \
    # /usr/local/opt/qt@5/bin \
    # $HOME/.cargo/bin/rustlings \

set -x VISUAL nvim
set -x EDITOR nvim
set -x HISTSIZE 10000
set -x LESS "FRX"
set -x LSCOLORS gxgxcxdxbxegedabagacad
set -x PSQL_EDITOR 'nvim -c "setf sql"'
set -x RI "--format ansi -T"
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -x GOPRIVATE github.com/mimic-core/*

# Claude Code config
set -x CLAUDE_CODE_USE_VERTEX 1
set -x CLOUD_ML_REGION us-east5
set -x ANTHROPIC_VERTEX_PROJECT_ID experimental-micah-cooper

# for HiDpi
set -x DOCKER_BUILDKIT 1

#Use this for alacritty
set -x TERM xterm-256color

# erlang/elixir Env Vars
set -x KEV
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_BUILD_DOCS no
set -x KERL_INSTALL_HTMLDOCS no
set -x KERL_INSTALL_MANPAGES no

abbr --add c circleci
abbr --add color alacritty-colorscheme status
abbr --add colors 'alacritty-colorscheme apply (alacritty-colorscheme list | fzf )'
abbr --add d docker
abbr --add df df -h                          # human-readable sizes
abbr --add di docker images abbr --add dii docker images -a -q abbr --add dit yadm
abbr --add dlg yadm log --graph --oneline --decorate --color --all
abbr --add dot yadm
abbr --add dps docker ps -a
abbr --add dpsi docker ps -aq
abbr --add dst yadm status
abbr --add free free -m                      # show sizes in MB
abbr --add h heroku
abbr --add t terraform
abbr --add a aws
abbr --add o op
abbr --add g glab
# abbr --add k 'xset r rate 220 48; setxkbmap -option ctrl:nocaps'
# abbr --add keyboard 'xset r rate 220 48; setxkbmap -option ctrl:nocaps'
abbr --add k kubectl
abbr --add kns kubens
abbr --add kt kitty --session ~/code/codepun/config/startup_session.kitty.conf
abbr --add kx kubectx
abbr --add mk minikube
abbr --add more less
abbr --add nfig command nvim ~/.config/nvim/init.vim
abbr --add pacmanclean 'sudo pacman -Rns (pacman -Qtdq)'
abbr --add pgdisable systemctl disable postgresql.service
abbr --add pgenable systemctl enable postgresql.service
abbr --add pgrestart systemctl restart postgresql.service
abbr --add pgstart systemctl start postgresql.service
abbr --add pgstop systemctl stop postgresql.service
abbr --add pm podman
abbr --add uuid 'uuidgen | xclip -selection clipboard'

abbr --add gamend git commit --amend -C HEAD
abbr --add gain 'git fetch && git rebase origin/main'
abbr --add gap git add --patch
abbr --add gb git branch --sort=-committerdate
abbr --add gc git commit -v
abbr --add gcl git clean -f -d
abbr --add gco 'git branch | fzf | xargs git checkout'
abbr --add gdel 'git branch | fzf -m | xargs git branch -D'
abbr --add gd git diff
abbr --add gdc git diff --cached
abbr --add glg git log --graph --oneline --decorate --color --all
abbr --add glod git log --oneline --decorate
abbr --add gra git rebase --abort
abbr --add grc git rebase --continue
abbr --add gst git status
abbr --add gow git show
abbr --add gwip git commit -m WIP
abbr --add show gh pr view --web
abbr --add gelete "git branch --merged | rg -v main -N | xargs git branch -d"
abbr --add grain "git fetch && git rebase main"
abbr --add tf op run --env-file .env -- terraform
abbr --add nd op run --env-file .env -- nomad
abbr --add mp multipass
abbr --add e exercism
abbr --add g gcloud
abbr --add j just
abbr --add mr mise run

alias clipboard="xclip -selection clipboard"
alias ls="lsd -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

alias gush="git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease"
alias gull="git pull --rebase origin (git rev-parse --abbrev-ref HEAD) --autostash"


# source_existing $HOME/.asdf/asdf.fish
# source_existing ~/.asdf/asdf.fish
# source_existing /opt/asdf-vm/asdf.fish
# source_existing /opt/homebrew/opt/asdf/libexec/asdf.fish
# source_existing $HOME/.config/op/plugins.sh
# source_existing $HOME/.mac-fish.fish
# source_existing $HOME/google-cloud-sdk/path.fish.inc
starship init fish | source
# direnv hook fish | source
direnv hook fish | source
$HOME/.local/bin/mise activate fish | source

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
set -x PATH $PATH /Users/micahcooper/.bin
set -x MANPATH $MANPATH /Users/micahcooper/.local/share/man
