# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate

# zstyle ':completion:*' matcher-list '+' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# menu if nb items > 2
zstyle ':completion:*' menu select=2