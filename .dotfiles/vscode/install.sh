#!/bin/sh
if command -v code >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi
	mkdir -p "$VSCODE_HOME/User"

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	while read -r module; do
		code --install-extension "$module" || true
	done <"$DOTFILES/vscode/extensions.txt"
fi
if command -v code-insiders >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code - Insiders"
	else
		VSCODE_HOME="$HOME/.config/Code - Insiders"
	fi
	mkdir -p "$VSCODE_HOME/User"

	ln -sf "$DOTFILES/vscode/insiders-settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	while read -r module; do
		code-insiders --install-extension "$module" || true
	done <"$DOTFILES/vscode/insiders-extensions.txt"
fi