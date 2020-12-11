#! /bin/bash

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

alias ll='ls -l'

alias vi='vim'

alias be='bundle exec'

alias gap='git add -p'
alias gnap='git add -N . && git add -p'
alias glp='git log -p'
alias glg='git log --graph --oneline --decorate --color --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcl='git clean -f -d'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glod='git log --oneline --decorate'
alias gp='git push'
alias gpr='git pull --rebase'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias reset-authors='git commit --amend --reset-author -C HEAD'

# k8s

## Add completion
complete -F __start_kubectl k

alias k="kubectl"
alias kg="kubectl get"
alias kl="kubectl logs"

## Kubectx
alias kctx="kubectx"
alias kns="kubens"

# image by name
function k-img-for {
  kubectl get pods -l name="$@" -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort
}


# Minikube

alias mk="minikube"

# Good diff
function diff {
  colordiff -u "$@" | less -RF
}
