[[ $- != *i* ]] && return

use_color=true

source ~/.posix_alias
source ~/.posix_export
source ~/.posix_functions

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

. $HOME/.asdf/asdf.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
