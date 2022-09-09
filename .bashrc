# ~/.bashrc
[[ $- != *i* ]] && return

#source kubectl-completion and alias it.
#https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete
# source <(kubectl completion bash)
# alias k=kubectl
# complete -F __start_kubectl k

use_color=true

# shell options
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

source ~/.posix_export
source ~/.posix_alias
source ~/.posix_functions

# # ex - archive extractor; usage: ex <file>

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.sendgrid ] && source ~/.sendgrid
[ -f ~/.alexa-api-key ] && source ~/.alexa-api-key
[ -f ~/.alexa_http_cookie ] && source ~/.alexa_http_cookie
[ -f ~/.semrush-api-key ] && source ~/.semrush-api-key
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.aws/env.local.sh ] && source ~/.aws/env.local.sh

eval "$(starship init bash)"
