# config.nu

use std/util "path add"

# $env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
# $env.SSH_AUTH_SOCK = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

path add  /opt/homebrew/bin 
path add  /usr/local/bin 
path add  /Applications/Postgres.app/Contents/Versions/latest/bin 
path add  /nix/var/nix/profiles/default/bin
path add  /Users/micahcooper/.local/bin/mise

use ($nu.default-config-dir | path join mise.nu)

alias show   = gh pr view --web
alias fg     = job unfreeze
alias g      = gcloud

# GIT helpers
alias gamend = git commit --amend -C HEAD
alias gap    = git add --patch
alias gb     = git branch | lines
alias gc     = git commit -v
alias gca    = git commit -a -v
alias gcam   = git commit --amend -C HEAD
alias gcl    = git clean -f -d
alias gco    = git checkout
alias gd     = git diff
alias gdc    = git diff --cached
alias glg    = git log --graph --oneline --decorate --color --all
alias gmpr   = git checkout master and git pull --rebase origin master --autostash
alias gnap   = git add -N --ignore-removal . and gap and gref
alias gnpr   = git checkout main and git pull --rebase origin main --autostash
alias gow    = git show
alias gpr    = git pull --rebase
alias gr     = git rebase
alias gra    = git rebase --abort
alias grc    = git rebase --continue
alias grm    = git rebase master --autostash
alias grom   = git rebase origin/master --autostash
# alias gst    = git status -s
alias gst    = git status
alias gull   = git pull --rebase origin (git rev-parse --abbrev-ref HEAD)
alias gush   = git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease
alias gwip   = git commit -a -m "wip"

alias dot = yadm
alias dst = yadm status
alias dap = yadm add -u -p
alias dlg = yadm log --graph --oneline --decorate --color --all
alias dain = yadm pull rebase origin/master

def gb --wrapped [...args] { git branch --sort=-committerdate ...$args | lines }
def gri [count] { git rebase --interactive $'HEAD~($count)' }
def gain --wrapped [...args] { git fetch; git rebase origin/main ...$args }
def glod --wrapped [...args] { git log --pretty=format:"%C(auto)%h%d %s %Cblue%an %Cgreen(%cr)" ...$args }

#git log as a nushell table
def glog [lines=500] {
  (
  git log 
    --pretty=format:"%h»¦«%s»¦«%an»¦«%d"
    -n $lines
    | lines
    | split column "»¦«" hash message author branch
    | upsert message {|m| $m.message | truncate $in 80}
    | less
  )
}

#checkout a branch from a dropdown
def gco [] { git branch --sort=-committerdate
  | lines 
  | input list "Chose a branch" 
  | ^git checkout ($in | str trim)
}

def truncate [string length: int] {
  if ($string | str length) > $length {
    let max: int = $length - 3
    ($string | str substring 0..$max) + '...'
  } else {
    $string
  }
}
