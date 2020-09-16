BREW_ZSH="$(brew --prefix)/bin/zsh"
if [[ -x "${BREW_ZSH}" ]] && ! grep -q ${BREW_ZSH} /etc/shells; then
    echo "${BREW_ZSH}" | sudo tee -a /etc/shells
fi
