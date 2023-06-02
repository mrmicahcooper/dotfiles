# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

[[ $- != *i* ]] && return

use_color=true

source ~/.posix_alias
source ~/.posix_export
source ~/.posix_functions

# Load Git completion
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# fpath=(~/.zsh $fpath)
# autoload -Uz compinit && compinit

[ -f /opt/asdf-vm/asdf.sh ] && . /opt/asdf-vm/asdf.sh
[ -f ~/.asdf/asdf.sh ] && . ~/.asdf/asdf.sh
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

if [[ ! -e ~/.zsh/zsh-autosuggestions/.git/ ]]; then
  echo "Zsh autosuggestions not found. Installing"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export GPG_TTY=$(tty)

# opam configuration
[[ ! -r /Users/micah.cooper/.opam/opam-init/init.zsh ]] || source /Users/micah.cooper/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export GPG_TTY=$(tty)
