#!/bin/sh
set -e
code --list-extensions >"$DOTFILES/vscode/extensions.txt" || true
code-insiders --list-extensions >"$DOTFILES/vscode/insiders-extensions.txt"