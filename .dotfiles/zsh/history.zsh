export HISTFILE="${HOME}/.histfile"
touch "${HISTFILE}"
export HISTSIZE=10000000
export SAVEHIST=10000000

## History command configuration
## From: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY     # add commands to HISTFILE in order of execution
setopt SHARE_HISTORY          # share command history data
