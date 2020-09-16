# Lines configured by zsh-newuser-install
setopt auto_cd beep extended_glob no_match
unsetopt notify
bindkey -e
# End of lines configured by zsh-newuser-install

fpath=($DOTFILES/functions $fpath)

autoload -U "$DOTFILES"/functions/*(:t)

# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST