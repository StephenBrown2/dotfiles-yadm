#!/bin/sh

alias l="ls -lah"
alias la="ls -a"
alias ll="ls -l"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

alias cdr='cd "$(git rev-parse --show-toplevel)"'

# quick hack to make watch work with aliases
alias watch='watch -c -t '
