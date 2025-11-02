alias g = glab;
alias gamend = git commit --amend -C HEAD;
alias gap = git add --patch;
alias gb = git branch;
alias gc = git commit -v;
alias gca = git commit -a -v;
alias gcam = command git commit --amend -C HEAD;
alias gcl = git clean -f -d;
alias gco = git checkout;
alias gd = git diff;
alias gdc = git diff --cached;
alias glg = git log --graph --oneline --decorate --color --all;
alias glod = git log --oneline --decorate;
alias gmpr = git checkout master and git pull --rebase origin master --autostash;
alias gnap = git add -N --ignore-removal . and gap and gref;
alias gnpr = git checkout main and git pull --rebase origin main --autostash;
alias gow = git show;
alias gpr = git pull --rebase;
alias gr = git rebase;
alias gra = git rebase --abort;
alias grc = git rebase --continue;
alias grm = command git rebase master --autostash;
alias grom = command git rebase origin/master --autostash;
alias gst = git status;
alias gull = git pull --rebase origin (git rev-parse --abbrev-ref HEAD);
alias gush = git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease;
alias gwip = command git commit -a -m wip;
alias nfig = nvim ~/nix-config/nvim.nix;
alias pm = podman;
alias fg = job unfreeze;


let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force
