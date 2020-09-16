function rebuild_antibody(){
  antibody bundle < "$DOTFILES/antibody/plugins.txt" > ~/.zsh_plugins.sh
  antibody update
}