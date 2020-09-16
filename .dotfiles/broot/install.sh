#!/usr/bin/env zsh
TMP_FILE=$(mktemp -t broot)
mv ~/.zshrc "${TMP_FILE}"

echo "# Source for broot usage" > ~/.zshrc
command -v broot && broot --install

mv ~/.zshrc "${DOTFILES}/broot/aliases.zsh"
mv "${TMP_FILE}" ~/.zshrc