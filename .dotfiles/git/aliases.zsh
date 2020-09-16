#!/bin/sh
if command -v hub >/dev/null 2>&1; then
	alias git='hub'
fi

alias ga='git add'
alias gaa='git add -A'
alias gb='git branch -v'
alias gc='git commit -s'
alias gca='git commit -s -a'
alias gcam='git commit -s -a -m'
alias gcm='git commit -s -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gpr='gp && git pr'
alias groot='cd ./$(git rev-parse --show-cdup)'
alias gs='git status -sb'
alias gti='git'

if command -v svu >/dev/null 2>&1; then
	alias gtpatch='git tag `svu p`; svu c'
	alias gtminor='git tag `svu m`; svu c'
	alias gtn='git tag `svu n`; svu c'
fi